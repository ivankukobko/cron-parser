require "cron/segment"

module Cron
  class Expression
    CRONTAB_REGEX = /([0-9\/\*\-\,]+\s+){5}([\w\-\/\s]+)/

    attr_reader :minute_raw, :hour_raw, :day_of_month_raw, :month_raw, :day_of_week_raw, :command_raw
    attr_reader :input

    def initialize(input)
      @input = input
      arr = input.split(' ')

      raise 'Invalid expression' unless Expression.valid?(input)

      @minute_raw = arr.shift.strip
      @hour_raw = arr.shift.strip
      @day_of_month_raw = arr.shift.strip
      @month_raw = arr.shift.strip
      @day_of_week_raw = arr.shift.strip
      @command_raw = arr.join(' ').strip
    end

    def self.valid?(input)
      CRONTAB_REGEX.match?(input)
    end

    def minute
      Segment.new(@minute_raw, 0..59).result.join(', ')
    end

    def hour
      Segment.new(@hour_raw, 0..23).result.join(', ')
    end

    def day_of_month
      Segment.new(@day_of_month_raw, 1..31).result.join(', ')
    end

    def month
      Segment.new(@month_raw, 1..12).result.join(', ')
    end

    def day_of_week
      Segment.new(@day_of_week_raw, 0..6).result.join(', ')
    end

    def command
      @command_raw
    end
  end
end
