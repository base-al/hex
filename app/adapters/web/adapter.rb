# app/adapters/web_adapter.rb
require "sinatra/base"
require "json"
require_relative "../../ports/api_port"
require_relative "../../ports/blog_port"
require_relative "../../domain/repositories/blog"
require_relative "../../domain/models/post"

module App
  module Adapters
    module Web
      class Adapter < Sinatra::Base
        BLOG_REPOSITORY = App::Domain::Repositories::Blog.new

        #set views directory for erb
        set :views, File.expand_path("../views", __FILE__)

        #home page
        get "/" do
          erb :'home/index'
        end

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

App::Adapters::Web::Adapter.run! if __FILE__ == $0
