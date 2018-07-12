module Import
  module Data
    module Paths
      # module ClassMethods
      # end
      
      module InstanceMethods
        # TODO: check this on the processor class.
        delegate :root_path, :item_path, :name_path, :categories_path, :twitter_path, to: :client
      end
      
      def self.included(receiver)
        # receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end
