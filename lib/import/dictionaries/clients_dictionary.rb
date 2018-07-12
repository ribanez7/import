module Import
  module Dictionaries
    # TODO: consider if it's necessary or not to have the :item_path
    Client = Struct.new(
      :root_path,
      :item_path,
      :name_path,
      :categories_path,
      :twitter_path
    )
    CLIENTS = {
      'capterra'       => Client.new(Array, nil, 'name', 'tags', 'twitter'),
      'softwareadvice' => Client.new('products', Array, 'title', 'categories', 'twitter'),
      'futureclient'   => Client.new(nil, nil, 'name', 'categories', 'twitter')
    }.freeze
  end
end
