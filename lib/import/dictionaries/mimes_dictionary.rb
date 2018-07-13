module Import
  module Dictionaries
    MIMES = {
      'yaml' => Processors::YAMLProcessor,
      'yml'  => Processors::YAMLProcessor,
      'json' => Processors::JSONProcessor
    }.freeze
  end
end
