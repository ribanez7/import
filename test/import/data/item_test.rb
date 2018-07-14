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

      def test_ensure_categories_is_allways_an_enumerable
        assert_respond_to @item.categories, :each
      end

      def test_it_has_the_requested_log_format
        pattern = /Name: [^;]+; Categories: [^;]+; Twitter: [^\z]+\z/
        assert_match pattern, @item.log
      end
    end
  end
end
