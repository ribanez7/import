require 'yaml'
require 'import/application_processor'

module Import
  module Adapters
    class YAMLAdapter < ApplicationProcessor
      def import!
        super
      end

      private

        def stream
          File.open(file, 'r') do |io|
            YAML.load_stream(io) do |collection|
              yield(collection)
            end
          end
        end
    end
  end
end
