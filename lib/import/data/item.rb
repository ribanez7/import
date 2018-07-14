module Import
  module Data
    class Item
      attr_accessor :name, :twitter, :categories

      def initialize(name: nil, twitter: nil, categories: nil)
        @name = name
        @twitter = twitter
        @categories = categories
        yield self if block_given?
      end
    end
  end
end
