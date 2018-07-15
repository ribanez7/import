require 'import/version'
require 'app_paths'
Dir[Import.adapters].each { |adapter| require adapter }
require 'import/dictionaries/mimes_dictionary'
require 'import/file_locator'

module Import
  class Import
    def self.call(client, file)
      new(client, file).call
    end

    def initialize(client, file)
      @client = client
      @file   = FileLocator.get_path(file)
    end

    def call
      mime = File.extname(@file)[1..-1]
      import(mime)
    end

    private

      def import(mime)
        adapter_klass = Dictionaries::MIMES[mime]
        raise adapter_klass, <<~EOE if adapter_klass.respond_to?(:exception)
          Parser still not implemented for #{mime} files
        EOE
        adapter = adapter_klass.new(@file, @client)
        adapter.import!
      end
  end
end
