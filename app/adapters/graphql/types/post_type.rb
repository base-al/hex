# app/adapters/graphql/types/post_type.rb
require "graphql"

module App
  module Adapters
    module GraphQL
      module Types
        class PostType < ::GraphQL::Schema::Object
          field :title, String, null: false
          field :content, String, null: false
          field :author, String, null: false

          # Define other fields as needed
        end
      end
    end
  end
end
