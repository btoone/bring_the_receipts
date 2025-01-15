require_relative './receipt'
require_relative './order'

# MINITEST_REPORTER=SpecReporter rake
require 'minitest/reporters'
Minitest::Reporters.use!

require 'pry-byebug'
require 'minitest/autorun'
