require 'import/data/paths'
require 'import/dictionaries/clients_dictionary'

module Import
  module Processors
    class ApplicationProcessor
      include Import::Data::Paths

      attr_reader :file, :client

      def initialize(file, client)
        @file   = file
        @client = Dictionaries::CLIENTS[client]
      end

      def import!
        raise NotImplementedError, 'Please define this method on child classes.'
      end
    end
  end
end
