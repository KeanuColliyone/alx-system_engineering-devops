#!/usr/bin/env ruby

input = ARGV[0]
pattern = /^\d{10}$/

if pattern.match(input)
  puts "#{input}$"
end
