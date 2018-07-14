require 'forwardable'

module Import
  module Data
    module Paths
      module InstanceMethods
        extend Forwardable
        # TODO: check this on the processor class.
        def_delegators :@client, :root_path, :item_path, :name_path, :categories_path, :twitter_path, :splitter
      end

      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
    end
  end
end
