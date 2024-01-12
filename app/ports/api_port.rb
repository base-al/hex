# lib/hex/ports/api_port.rb
module Hex
  module Ports
    class ApiPort
      def initialize(service)
        @service = service
      end

      def call
        @service.perform
      end
    end
  end
end
