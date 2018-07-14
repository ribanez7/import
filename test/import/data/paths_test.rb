require 'test_helper'

class Dummy
  include Import::Data::Paths

  attr_reader :client

  def initialize(client)
    @client = client
  end
end

module Import
  module Data
    class PathsTest < Minitest::Test

      def setup
        @client = Dictionaries::Client.new(
          'root',
          'item',
          'name',
          'categories',
          'twitter'
        )

        @dummy = ::Dummy.new(@client)
      end

      def test_it_delegates_path_methods_to_client_instance_variable_of_receiver
        assert_respond_to @dummy, :root_path
        assert_nil @dummy.splitter
      end
    end
  end
end
