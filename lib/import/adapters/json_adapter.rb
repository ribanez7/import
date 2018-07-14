require 'json'
require 'import/application_processor'

module Import
  module Adapters
    class JSONAdapter < ApplicationProcessor
      def import!
        super
      end

      private

        def stream
          # to avoid encoding issues we have to pass the read file.
          document   = File.read(file)
          collection = JSON.load(document)
          yield(collection)
        end
    end
  end
end
