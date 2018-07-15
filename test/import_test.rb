require "test_helper"

class ImportTest < Minitest::Test
  def setup
    @client_1 = ['capterra', 'feed-products/capterra.yaml']
    @client_2 = ['softwareadvice', 'feed-products/softwareadvice.json']
  end

  def test_that_it_has_a_version_number
    refute_nil ::Import::VERSION
  end

  def test_it_takes_a_file_a_client_and_outputs_what_is_doing
    client_1 = Import::Import.new(*@client_1)
    assert_output(<<~OUTPUT) { client_1.call }
        importing: Name: "GitGHub"; Categories: "Bugs & Issue Tracking, Development Tools"; Twitter: "github"
        importing: Name: "Slack"; Categories: "Instant Messaging & Chat, Web Collaboration, Productivity"; Twitter: "slackhq"
        importing: Name: "JIRA Software"; Categories: "Project Management, Project Collaboration, Development Tools"; Twitter: "jira"
    OUTPUT

    client_2 = Import::Import.new(*@client_2)
    assert_output(<<~OUTPUT) { client_2.call }
      importing: Name: "Freshdesk"; Categories: "Customer Service, Call Center"; Twitter: "@freshdesk"
      importing: Name: "Zoho"; Categories: "CRM, Sales Management"; Twitter: ""
    OUTPUT
  end

  def test_it_exits_with_0_when__proper_arguments_are_provided
    system('exe/import capterra feed-products/capterra.yaml > /dev/null 2>&1')
    assert_equal 0, $?.exitstatus
  end

  def test_it_exits_with_1_when_arguments_are_not_provided
    system('exe/import > /dev/null 2>&1')
    assert_equal 1, $?.exitstatus
  end

  def test_it_informs_when_a_filetype_is_not_supported
    file = 'newcompany.csv'

    assert_raises(NotImplementedError) do
      Import::Import.call('newcompany', file)
    end
  end
end
