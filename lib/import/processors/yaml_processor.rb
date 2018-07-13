require 'yaml'

module Import
  module Processors
    class YAMLProcessor < ApplicationProcessor
      def import!
        puts self.inspect
      end
    end
  end
end
