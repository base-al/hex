# app/adapters/graphql/types/query_type.rb

require_relative "../../../ports/blog_port"
require_relative "../../../domain/blog_repository"

module App
  module Adapters
    module GraphQL
      module Types
        class QueryType < ::GraphQL::Schema::Object
          BLOG_REPOSITORY = App::Domain::BlogRepository.new

          field :posts, [Types::PostType], null: false, description: "List of all posts"

          field :post, Types::PostType, null: false do
            description "Find a post by ID"
            argument :id, ID, required: true
          end

          def post(id:)
            # Re-initializing blog_port within the method
            blog_port = App::Ports::BlogPort.new(self.class::BLOG_REPOSITORY)
            blog_port.find_post(id)
          end

          def posts
            # Re-initializing blog_port within the method
            blog_port = App::Ports::BlogPort.new(self.class::BLOG_REPOSITORY)
            blog_port.list_posts
          end
        end
      end
    end
  end
end
