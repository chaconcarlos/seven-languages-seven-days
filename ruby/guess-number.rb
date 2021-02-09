#!/usr/bin/env ruby 
target = rand(20)
guess  = nil

while not guess == target
	guess = gets.chomp.to_i

	if guess > target
		puts "Too High!"
	elsif guess < target
		puts "Too loooooooow"
	else
		puts "GOOD JOB!!!!!!"
	end
end