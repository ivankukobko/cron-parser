require "test_helper"
require "cron/expression"

class Cron::ExpressionTest < Minitest::Test
  def test_initialize
    assert_equal Cron::Expression.new('0 0 0 0 0 /bin/sh').class, Cron::Expression
  end

  def test_valid
    assert Cron::Expression.valid?('0 0 0 0 0 /bin/sh')
  end

  def test_invalid
    refute Cron::Expression.valid?('/bin/sh')
  end

  def test_minute
    assert_equal Cron::Expression.new('0 0 0 0 0 /bin/sh').minute, '0'
  end

  def test_hour
    assert_equal Cron::Expression.new('0 0 0 0 0 /bin/sh').minute, '0'
  end

  def test_day_of_month
    assert_equal Cron::Expression.new('0 0 1 0 0 /bin/sh').day_of_month, '1'
  end

  def test_month
    assert_equal Cron::Expression.new('0 0 0 1 0 /bin/sh').month, '1'
  end

  def test_day_of_week
    assert_equal Cron::Expression.new('0 0 0 0 0 /bin/sh').day_of_week, '0'
  end

  def test_command
    assert_equal Cron::Expression.new('0 0 0 0 0 /bin/sh').command, '/bin/sh'
  end
end

