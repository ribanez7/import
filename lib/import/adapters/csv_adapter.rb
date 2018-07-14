require 'csv'

module Import
  module Adapters
    class CSVAdapter < ApplicationProcessor
      def import!
        puts self.inspect
      end
    end
  end
end
