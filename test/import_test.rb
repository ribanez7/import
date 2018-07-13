require "test_helper"

class ImportTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Import::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_it_informs_when_a_filetype_is_not_supported
    file = 'newcompany.csv'

    assert_raises(NotImplementedError) do
      Import::Import.call('newcompany', file)
    end
  end
end
