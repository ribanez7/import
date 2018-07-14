module Import
  module Dictionaries
    Client = Struct.new(
      :root_path,
      :item_path,
      :name_path,
      :categories_path,
      :twitter_path,
      :splitter
    ) do
      def initialize(root, item, name, categories, twitter, splitter = nil)
        super(Array(root), Array(item), name, categories, twitter, splitter)
      end
    end

    CLIENTS = {
      'capterra'       => Client.new(nil, nil, 'name', 'tags', 'twitter', ','),
      'softwareadvice' => Client.new('products', nil, 'title', 'categories', 'twitter'),
      'futureclient'   => Client.new(nil, nil, 'name', 'categories', 'twitter')
    }.freeze
  end
end
