module Import
  class FileLocator
    class << self
      def get_path(string)
        return download_temp_file if web_url?(string)
        File.expand_path(string)
      end

      private

        def web_url?(string)
          uri = URI.parse(string)
          return uri if %w[http https].include? uri.scheme
        rescue URI::InvalidURIError
          nil
        end

        def download_temp_file
          raise NotImplementedError
        end
    end
  end
end
