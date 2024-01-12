# app/ports/blog_port.rb
module App
  module Ports
    class BlogPort
      def initialize(repository)
        @repository = repository
      end

      def create_post(title, content, author)
        post = App::Domain::Models::Post.new(title, content, author)
        @repository.add_post(post)
      end

      def list_posts
        @repository.list_posts
      end
    end
  end
end
