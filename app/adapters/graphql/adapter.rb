# app/adapters/graphql/adapter.rb
require "sinatra/base"
require "graphql"

require_relative "../graphql/schema"

module App
  module Adapters
    module GraphQL
      class Adapter < Sinatra::Base
        post "/graphql" do
          # get the query string from the request body query parameter
          query_string = request.body.read

          json_params = JSON.parse(query_string)
          result = App::Adapters::GraphQL::Schema.execute(json_params["query"], variables: json_params["variables"])

          content_type :json
          result.to_json
        end

        # Serve the GraphiQL interface
        get "/graphiql" do
          content_type "text/html"
          send_file "public/graphiql.html"
        end

        run! if app_file == $0
      end
    end
  end
end
