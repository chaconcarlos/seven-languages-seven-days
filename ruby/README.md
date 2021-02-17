# Seven languages in seven weeks: Ruby
## Day 1: Finding a Nanny
* __Ruby is an interpreted, object-oriented, dynamically typed language from a family of so-called scripting languages.__
* Interpreted means that Ruby code is executed by an interpreter rather than a compiler. 
* Dynamically typed means that types are bound at execution time rather than compile time. In general, the trade-off for such a strategy is flexibility versus execution safety.
* Object-oriented means the language supports encapsulation (data and behavior are packaged together), inheritance through classes (object types are organized in a class tree), and polymorphism (objects can take many forms). Ruby is a pure object-oriented language.
 * Ruby is not hugely efficient in terms of execution speed, but it makes programmers very productive.

### Day 1 Self-Study

* [The Ruby API](https://rubyapi.org/) 
* [The free online version of Programming Ruby: The Pragmatic Programmer’s Guide [TFH08]](https://ruby-doc.com/docs/ProgrammingRuby/) 
 * A method that substitutes part of a string:

 ```ruby
 sentence = "My name is Carlos"
 sentence.sub! 'Carlos', 'Jose'
puts sentence #prints "My name is Jose"
```
* [Ruby’s regular expressions](https://ruby-doc.org/core-2.5.1/Regexp.html)
 ```ruby
# Find the word 'any'
" The bedding was hardly able to cover it and seemed ready to slide off any moment." =~ /any/
# Outputs: 71
 ```
 * [Information about Ruby’s ranges.](https://ruby-doc.org/core-2.5.1/Range.html)
  ```ruby
(-1..-5).to_a      #=> []
(-5..-1).to_a      #=> [-5, -4, -3, -2, -1]
('a'..'e').to_a    #=> ["a", "b", "c", "d", "e"]
('a'...'e').to_a   #=> ["a", "b", "c", "d"]

# A range is a Range object!
   ```
* Print the string “Hello, world.”
 ```ruby
 puts "Hello World"
 ```
 * Print your name ten times.
 ```ruby
 for i in 1..5
   puts "#{i}: My name is Carlos!"
 end
 ```
 * Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
  ```ruby
 for i in 1..10
   puts "This is sentence number #{i}"
 end
 ```
 * Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high. [This is my solution.](https://github.com/chaconcarlos/seven-languages-seven-weeks/blob/main/ruby/day1-guess-number.rb) 
 ```ruby
 #!/usr/bin/env ruby 
target = rand(20)
guess  = nil
https://git.smartmatic.net/engineering_client_side_b/esbu_dev_saes_cpp_framework/merge_requests/385/diffs
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
```
## Day 2: Floating Down from the Sky
* Every function returns something. If you do not specify an explicit return, the function will return the value of the last expression that’s processed before exiting. Like everything else, this function is an object. 
* Ruby has symbols, that unlike objects. Symbol is an identifier preceded with a colon, like :symbol. Symbols are great for naming things or ideas. Although two strings with the same value can be different physical strings, identical symbols are the same physical object. 
```ruby
​​>> 'string'.object_id​​
 ​​=> 3092010​​
 ​​>> 'string'.object_id​​
 ​​=> 3089690​​
 ​​>> :string.object_id​​
 ​​=> 69618​​
 ​​>> :string.object_id​​
 ​​=> 69618​​
```
* Arrays have an incredibly rich API. You can use an array as a queue, a linked list, a stack, or a set. 
* You can specify code blocks with {/} or do/end. The typical Ruby convention is to use braces when your code block is on one line and use the do/end form when the code blocks span more than one line. Code blocks can take one or more parameters.
* Object-oriented languages use inheritance to propagate behavior to similar objects. When the behaviors are not similar, either you can allow inheritance from more than one class (multiple inheritance) or you can look to another solution. Experience has shown that multiple inheritance is complicated and problematic. Java uses interfaces to solve this problem. Ruby uses modules. A module is a collection of functions and constants. When you include a module as part of a class, those behaviors and constants become part of the class.
```ruby
#This mixin adds a capability to the Person class, so it can save it's string representation to a file.
 ​​module ToFile​​
 ​​  def filename​​
 ​​    "object_#{self.object_id}.txt"​​
 ​​  end​​
 ​​  def to_f​​
 ​​    File.open(filename, 'w') {|f| f.write(to_s)}​​
 ​​  end​​
 ​​end​​
 ​​​​
 ​​class Person​​
 ​​  include ToFile​​
 ​​  attr_accessor :name​​
 ​​​​
 ​​  def initialize(name)​​
 ​​    @name = name​​
 ​​  end​​
 ​​  def to_s​​
 ​​    name​​
 ​​  end​​
 ​​end​​
 ​​​​
 ​​Person.new('matz').to_f​​
 ```
## Cheat sheet
### if, else, unless statements

```ruby
if conditional [then]
   code...
[elsif conditional [then]
   code...]...
[else
   code...]
end

unless conditional [then]
   code
[else
   code ]
end
```

### Loops

```ruby
while conditional [do]
   code
end

until conditional [do]
   code
end

begin 
  code 
end while conditional

for variable [, variable ...] in expression [do]
   code
end
```
### Functions
[Other languages have functions, procedures, methods, or routines, but in Ruby there is only the method---a chunk of expressions that return a value.](http://docs.ruby-doc.com/docs/ProgrammingRuby/) 
```ruby
def myNewMethod(arg1, arg2, arg3)     # 3 arguments
  # Code for the method would go here
end

def myOtherNewMethod                  # No arguments
  # Code for the method would go here
end
```
### Arrays
```ruby
# Arrays work similar to Python. They can contain any type of object
a = [ 42, "show", 1.21 ]
puts a.length #Prints 3
b = Array.new
b[0] = "Test"
b[1] = 2
puts b # Prints ["Test", 2]
puts b[-1] # Prints 2
a = [1, 2, 3, 4, 5, 6, 7]
# Arrays can work with ranges
a[-3..-1] #=> [5, 6, 7]
```
### Hashes
```ruby
dict = { "A" => 1, "B" => 2}
dict["A"] #=> 1
# Hashes can use symbols a indexes.
test = {:test1 => 1, :test2 => 2}
test[:test1] # => 1
# Using a hash as named parameters for a function
def show_hash_values(options={})
  options.each do |key, value|
    puts "#{key}: #{value}"
  end
end
```
### Code blocks
```ruby
#A code block is a function without a name. You can pass it as a parameter to a function or a method.
10.times { puts "I'll just repeat this real quick." } # 10 is an integer. 'times' is a method that repeats a piece code.

test = {:test1 => 1, :test2 => 2}

#Block that acts as a foreach
test.each do |key, value|
  puts "#{key}: #{value}"
end

#Blocks can be used to enforce policy:
​​within_a_transaction do​​
 ​​  things_that​​
 ​​  must_happen_together​​
 ​​end​​
 ​​​​
 ​​def within_a_transaction​​
 ​​  begin_transaction​​
 ​​  yield​​
 ​​  end_transaction​​
 ​​end
 
 #To conditionally execute something:
 ​​ ​​in_case_of_emergency do​​
 ​​  use_credit_card​​
 ​​  panic​​
 ​​end​​
 ​​​​
 ​​def in_case_of_emergency​​
 ​​  yield if emergency?​​ #this a boolean method. def emergency?
 ​​end​​
```
### Mixins