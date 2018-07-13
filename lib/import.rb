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
      mime = File.extname(@file)[1..-1]
      import(mime)
    end

    private

      def import(mime)
        processor = Dictionaries::MIMES[mime]
        raise processor, <<~EOE if processor.respond_to?(:exception)
          Parser still not implemented for #{mime} files
        EOE
        puts processor.new(@file, @client).inspect
      end
  end
end
