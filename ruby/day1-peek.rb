#!/usr/bin/env ruby 
properties = ["object oriented", "duck typed", "productive", "fun"]
puts "My collection is: ", properties
puts "==============================="
properties.each { |property| puts "Ruby is #{property}." }
puts "==============================="
puts "Everything is an object."
puts "  4.class     = ", 4.class
puts "  false.class = ", false.class
puts "  true.class = ", true.class
puts "  true class has ", true.methods.size, " methods."
puts "==============================="

x = 4
puts "x == 4 appears to be true." if x == 4
puts "x == 4 appears to be false, unless..." unless x == 4 #This shouldn't print anything.

unless x == 4
	puts "Turns out x is not 4."
else
	puts "x is 4!"
end

puts "==============================="

x = 0
x = x + 1 while x < 10
puts "x = x + 1 while x < 10"
puts "result: ", x
puts "x = x - 1 until x == 1"
x = x - 1 until x == 1
puts "result: ", x

example_string = "Hola, mi nombre es Carlos."
puts example_string
example_string.sub! 'Carlos', 'Anna'
puts example_string
example_string = "duck, duck, duck, duck, duck, duck, duck, duck, duck, goose, duck"
puts example_string
example_string.sub! 'duck', 'dog'
puts example_string
example_string.gsub! 'duck', 'dog'
puts example_string
puts example_string =~ /goose/