$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "import"

require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new]
# Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]