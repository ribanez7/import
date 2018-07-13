require 'csv'

module Import
  module Processors
    class CSVProcessor < ApplicationProcessor
      def import!
        puts self.inspect
      end
    end
  end
end
