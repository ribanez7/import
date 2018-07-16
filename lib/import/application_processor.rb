require 'import/data/item'
require 'import/data/paths'
require 'import/dictionaries/clients_dictionary'

module Import
  class ApplicationProcessor
    include Data::Paths

    attr_reader :file, :client

    def initialize(file, client)
      @file   = file
      @client = Dictionaries::CLIENTS[client]
    end

    def import!
      stream do |db|
        collection(db).each do |record|
          generate_item(record)
        end
      end
      $stdout.flush
    end

    private

      def generate_categories(categories)
        return categories.uniq if categories.instance_of?(Array)
        categories.split(splitter).uniq
      end

      def generate_item(record)
        return generate_item(record.dig(*item_path)) unless item_path.empty?
        item = Data::Item.new do |i|
          i.name       = record[name_path]
          i.twitter    = record[twitter_path]
          i.categories = generate_categories(record[categories_path])
        end
        $stdout.puts "importing: #{item.log}"
      end

      def collection(db)
        return db if root_path.empty?
        db.dig(*root_path)
      end
  end
end
