require 'import/version'
require 'app_paths'
Dir[Import.processors].each { |processor| require processor }
require 'import/dictionaries/mimes_dictionary'

module Import
  class Import
    def self.call(client, file)
      new(client, file).call
    end

    def initialize(client, file)
      @client = client
      @file   = File.expand_path(file)
    end

    def call
      mime = 'yaml'
      # TODO: May be a good approach is to be able two define 2 control levels:
      # -------------
      # 1- The client (catperra, softwareadvice)
      # 2- The mime (json, yaml)
      # -------------
      # The first level should define a schema of the data structure for the given client.
      # The second one would choose the tool to use (id est, the library)
      import(mime)
    end

    private

      def import(mime)
        # Dictionaries::MIMES[mime].import(file, client)
        puts Dictionaries::MIMES[mime].new(@file, @client).inspect
      end
  end
end
