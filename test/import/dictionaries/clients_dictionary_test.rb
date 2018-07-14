require 'test_helper'

module Import
  module Dictionaries
    class ClientsDictionaryTest < Minitest::Test
      def test_it_does_not_complains_initializing_without_splitter
        refute_raises(ArgumentError) do
          Client.new('root', 'item', 'name', 'categories', 'twitter')
        end
      end

      def test_that_root_and_item_paths_are_arrays
        client = Client.new(%w[root path], 'item', 'name', 'categories', 'twitter')
        assert_instance_of Array, client.root_path
        assert_instance_of Array, client.item_path
        assert_equal %w[root path], client.root_path
        assert_equal ['item'], client.item_path
      end

      def test_clients_hash_return_proper_clients
        client = CLIENTS['capterra']
        assert_respond_to client, :root_path
        assert_respond_to client, :splitter
        assert_equal 'tags', client.categories_path
        assert_equal ',', client.splitter
      end
    end
  end
end
