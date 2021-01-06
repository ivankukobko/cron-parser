require "cron/parser/version"
require "cron/expression"

module Cron
  module Parser
    class Error < StandardError; end

    def self.parse(input)
      cron_expression = Cron::Expression.new(input)
      puts "minute       #{cron_expression.minute}"
      puts "hour         #{cron_expression.hour}"
      puts "day of month #{cron_expression.day_of_month}"
      puts "month        #{cron_expression.month}"
      puts "day of week  #{cron_expression.day_of_week}"
      puts "command      #{cron_expression.command}"
    rescue Error => e
      puts e.message
    end
  end
end
