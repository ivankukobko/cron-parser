require "test_helper"
require "cron/parser"

class Cron::ParserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Cron::Parser::VERSION
  end
end

