require 'test_helper'

module Import
  module Data
    class ItemTest < Minitest::Test

      def setup
        @item = Item.new
      end

      def test_it_responds_to_basic_attributes
        assert_respond_to @item, :name
        assert_respond_to @item, :twitter
        assert_respond_to @item, :categories
      end
    end
  end
end
