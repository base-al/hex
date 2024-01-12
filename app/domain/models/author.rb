# app/domain/post.rb

module App
  module Domain
    module Models
      class Author
        attr_reader :name, :email, :id

        def initialize(name:, email:, id: nil)
          @name = name
          @email = email
          @id = id
        end
      end
    end
  end
end
