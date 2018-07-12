require 'import/dictionaries/clients_dictionary'

module Import
  module Processors
    class ApplicationProcessor
      include Import::Data::Paths

      attr_reader :file, :client

      def initialize(file, client)
        @file = File.expand_path(file)
        @client = Dictionaries::CLIENTS[client]
      end
    end
  end
end
