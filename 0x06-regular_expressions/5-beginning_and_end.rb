#!/usr/bin/env ruby

input = ARGV[0]
pattern = /^h.n$/

if pattern.match(input)
  print "#{input}$"
end

puts
