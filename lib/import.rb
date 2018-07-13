require 'import/version'
require 'app_paths'
Dir[Import.processors].each { |processor| require processor }
require 'import/dictionaries/formats_dictionary'

module Import
  class Import
    # TODO: adjust this #call method when finished
    def self.call(*args)
      new(*args).call
    end

    def initialize(**options)
      @options = options
    end

    def call
      # TODO: May be a good approach is to be able two define 2 control levels:
      # -------------
      # 1- The client (catperra, softwareadvice)
      # 2- The format (json, yaml)
      # -------------
      # The first level should define a schema of the data structure for the given client.
      # The second one would choose the tool to use (id est, the library)
    end

    private

      def import(file, format, client)
        Dictionaries::FORMATS[format].import(file, client)
      end
  end
end
