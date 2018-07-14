module Import
  module Dictionaries
    MIMES = {
      'yaml' => Adapters::YAMLAdapter,
      'yml'  => Adapters::YAMLAdapter,
      'json' => Adapters::JSONAdapter,
      'csv'  => NotImplementedError
    }.freeze
  end
end
