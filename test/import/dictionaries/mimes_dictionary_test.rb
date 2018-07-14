require 'test_helper'

module Import
  module Dictionaries
    class MimesDictionaryTest < Minitest::Test
      def test_mimes_hash_returns_an_adapter_class
        mime = MIMES['yaml']
        assert_equal mime, Adapters::YAMLAdapter
      end
    end
  end
end
