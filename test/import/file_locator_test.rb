require "test_helper"

module Import
  class ImportTest < Minitest::Test
    def test_it_raises_not_implemented_error_when_using_a_uri
      assert_raises(NotImplementedError) do
        FileLocator.get_path('http://google.com/example.csv')
      end
    end

    def test_it_returns_an_aboslute_path_for_a_given_file_name
      assert_match %r{\A/}, FileLocator.get_path(__FILE__)
    end
  end
end
