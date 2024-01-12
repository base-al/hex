# app/domain/post.rb

module App
  module Domain
    module Models
      class Post
        attr_reader :title, :content, :author

        def initialize(title, content, author)
          @title = title
          @content = content
          @author = author
        end
      end
    end
  end
end
