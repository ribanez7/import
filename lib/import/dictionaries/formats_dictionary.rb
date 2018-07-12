module Import
  module Dictionaries
    FORMATS = {
      'yaml' => Processors::YAMLProcessor,
      'yml'  => Processors::YAMLProcessor,
      'json' => Processors::JSONProcessor
    }.freeze
  end
end
