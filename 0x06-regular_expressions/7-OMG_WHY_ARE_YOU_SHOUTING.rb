#!/usr/bin/env ruby

input = ARGV[0]
pattern = /[A-Z]/
result = input.scan(pattern).join
print "#{result}$" unless result.empty?
puts
