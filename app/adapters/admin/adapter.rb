# app/adapters/web_adapter.rb
require "sinatra/base"
require "json"
require_relative "../../ports/api_port"
require_relative "../../ports/blog_port"
require_relative "../../domain/blog_repository"
require_relative "../../domain/post"

module App
  module Adapters
    module Admin
      class Adapter < Sinatra::Base
        BLOG_REPOSITORY = App::Domain::BlogRepository.new

        #set views directory for erb
        set :views, File.expand_path("../views", __FILE__)

        #get posts
        get "/posts" do
          blog_port = App::Ports::BlogPort.new(BLOG_REPOSITORY)
          @posts = blog_port.list_posts
          erb :"post/index"
        end

        #get posts in json format
        get "/posts.json" do
          content_type :json
          blog_port = App::Ports::BlogPort.new(BLOG_REPOSITORY)
          posts = blog_port.list_posts
          posts.map { |post| { title: post.title, content: post.content, author: post.author } }.to_json
        end

        #create post
        post "/posts" do
          blog_port = App::Ports::BlogPort.new(BLOG_REPOSITORY)
          blog_port.create_post(params[:title], params[:content], params[:author])
          redirect "/posts"
        end

        #get new post form
        get "/posts/new" do
          erb :'post/new'
        end
      end
    end
  end
end

if __FILE__ == $0
  App::Adapters::Admin::Adapter.run!
end
