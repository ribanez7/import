module Import
  module Data
    class Item
      attr_accessor :name, :twitter, :categories

      def initialize(name: nil, twitter: nil, categories: nil)
        @name = name
        @twitter = twitter
        @categories = categories
        yield self if block_given?
        @categories = Array(@categories)
      end

      def log
        pattern =  %Q(Name: "#{name}"; )
        pattern << %Q(Categories: "#{categories.join(', ')}"; )
        pattern << %Q(Twitter: "#{twitter}")
      end
    end
  end
end
