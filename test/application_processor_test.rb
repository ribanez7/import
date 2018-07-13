require "test_helper"

class ApplicationProcessorTest < Minitest::Test
  def setup
    @file = File.join(Import.root, 'feed-products', 'capterra.yaml')
    @client = Import::Dictionaries::CLIENTS['capterra']
  end

  def test_that_it_takes_the_attributes_from_the_client_struct
    processor = Import::Processors::ApplicationProcessor.new(@file, 'capterra')
    assert_equal @client, processor.client
    assert_equal @client.twitter_path, processor.twitter_path
  end
end
