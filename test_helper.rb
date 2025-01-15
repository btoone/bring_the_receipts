require_relative './receipt'

# MINITEST_REPORTER=SpecReporter rake
require 'minitest/reporters'
Minitest::Reporters.use!

require 'pry-byebug'
require 'minitest/autorun'
