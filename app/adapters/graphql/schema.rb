# app/adapters/graphql/schema.rb
require "graphql"
require_relative "../../domain/post"
require_relative "types/post_type" # Import your PostType or other types
require_relative "types/query_type"

module App
  module Adapters
    module GraphQL
      class Schema < ::GraphQL::Schema
        query(Types::QueryType)
        # mutation(Types::MutationType) # Uncomment if you have mutations
      end
    end
  end
end
