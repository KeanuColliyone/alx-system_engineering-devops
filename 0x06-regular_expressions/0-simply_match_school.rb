#!/usr/bin/env ruby

input = ARGV[0]
pattern = /School/
matches = input.scan(pattern)
matches.each { |match| print "#{match}$" }
puts if matches.any?
