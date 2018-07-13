require 'json'

module Import
  module Processors
    class JSONProcessor < ApplicationProcessor
      def import!
        puts self.inspect
      end
    end
  end
end
