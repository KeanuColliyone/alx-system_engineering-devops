#!/usr/bin/env ruby

input = ARGV[0]
sender = input.match(/\[from:(.*?)\]/)[1]
receiver = input.match(/\[to:(.*?)\]/)[1]
flags = input.match(/\[flags:(.*?)\]/)[1]
puts "#{sender},#{receiver},#{flags}"
