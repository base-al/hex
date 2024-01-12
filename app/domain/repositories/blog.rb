# app/domain/blog_repository.rb
require "sqlite3"

module App
  module Domain
    module Repositories
      class Blog
        def initialize
          @db = SQLite3::Database.new "blog.db"
          setup_schema
        end

        def add_post(post)
          @db.execute "INSERT INTO posts (title, content, author) VALUES (?, ?, ?)", [post.title, post.content, post.author]
        end

        def list_posts
          @db.execute("SELECT title, content, author FROM posts").map do |title, content, author|
            App::Domain::Models::Post.new(title, content, author)
          end
        end

        private

        def setup_schema
          # SQL to create table if it doesn't exist
          schema = <<-SQL
          CREATE TABLE IF NOT EXISTS posts (
            id INTEGER PRIMARY KEY,
            title TEXT,
            content TEXT,
            author TEXT
          );
        SQL
          @db.execute(schema)
        end
      end
    end
  end
end
