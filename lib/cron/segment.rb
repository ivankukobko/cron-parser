module Cron
  class Segment
    LIST_REGEX = /(\w+\,)+/
    RANGE_REGEX = /(\d+)\-(\d+)/
    STEP_REGEX = /^([0-9\*\-]+)\/(\d+)/
    ALL_REGEX = /(^\*$)/
    NUMBER_REGEX = /\d+/

    attr_reader :result

    def initialize(str, range)
      @result = Segment.parse(str, range)
    end

    def to_s
      @result.join(' ')
    end

    class << self
      def parse str, range = nil
        return parse_all(str, range) if ALL_REGEX.match?(str)
        return parse_step(str, range) if STEP_REGEX.match?(str)
        return parse_list(str, range) if LIST_REGEX.match?(str)
        return parse_range(str, range) if RANGE_REGEX.match?(str)
        return parse_number(str, range) if NUMBER_REGEX.match?(str)
        [str].flatten
      end

      def parse_list str, range
        str
          .split(',')
          .map { |i| parse(i.strip, range) }
          .flatten
      end

      def parse_range str, range
        ms = RANGE_REGEX.match(str).captures
        (ms.first..ms.last).map(&:to_i)
      end

      def parse_step str, range
        segment = STEP_REGEX.match(str)[1]
        step = STEP_REGEX.match(str)[2].to_i
        from = segment.to_i.to_s == segment ? segment.to_i : 0
        _range = range.to_a.map(&:to_i)
        _range = parse_range(str, range) if RANGE_REGEX.match(segment)
        current = [from, _range.first.to_i].max
        out = [current]

        loop do
          break if current + step > _range.last.to_i
          current += step
          out << current
        end

        out
      end

      def parse_all str, range
        range.to_a
      end

      def parse_number str, range
        num = str.to_i
        raise 'Range exceeded' unless range.to_a.include?(num)
        [num]
      end
    end
  end
end
