module Import
  module Dictionaries
    MIMES = {
      'yaml' => Processors::YAMLProcessor,
      'yml'  => Processors::YAMLProcessor,
      'json' => Processors::JSONProcessor,
      'csv'  => NotImplementedError
    }.freeze
  end
end
