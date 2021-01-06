$LOAD_PATH.unshift File.expand_path("../../", __FILE__)
require "cron/parser"
require "cron/expression"
require "cron/segment"

Cron::Parser.parse(ARGV.join(' '))
