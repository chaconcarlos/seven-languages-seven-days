# Seven languages in seven weeks: Ruby
## My take on Ruby
Coming from a statically typed language as C++ (which I have been working for 8 years at the time I wrote this), it's weird for me to be able to transform or add behavior to classes dynamically, which reminds of .NET and Reflection but in a much more simpler way. Although I would be very cautious on using any of the open classes features, it makes me think that Ruby is a language that has an awesome user interface for us, the developers.
Making the code more readable is one the most important skills a software engineer can have, and a language that is "software engineer friendly" certaintly is a powerful tool. However, in this case, this tool can be too powerful and prone to abuse. I can imagine Ruby code growing ad-hoc and a careless developer adding an utility method to the base class Class; or as the book said, overriding Class.new.
Probably the best approach is to consider the size of the team, the maturity of its members, how close they are able to follow the design of the system and its components and the codebase guidelines/conventions/standards, to avoid unnecesary micromanaging and also avoid expensive errors, less readable code, and a less flexible codebase.
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
 ​​Person.new('carlos').to_f​​ #Creates object_[OBJECT_ID].txt and writes 'carlos'
 ```
 * Prefer ```unless ``` to ```if not ```.
### Day 2 Self-Study
 * Find out how to access files with and without code blocks. What is the benefit of the code block?
  ```ruby
  def open(fname)
    self.do_open(fname)
    if block_given?
      yield(self) # This will 'run' the block with given parameter
      self.close # File is automatically closed after block is processed.
    else
      return self # This will just return some value
    end
  end

  # With a block
  File::open('example.txt','w') do |new_file|
    new_file << 'lorem ipsum'
  end

  # No block
  new_file = File::open('example.txt','w')
  new_file << 'lorem ipsum'
  new_file.close

  f = File.open("the/file/path", "r")
  f.each_line do |line|
    puts line
  end
  f.close
  ```
 * How would you translate a hash to an array? Can you translate arrays to hashes?
  ```ruby
  # Array to hash
  arr = ["apples", "bananas", "coconuts", "watermelons"]
  ouput_hash = Hash[arr.collect { |v| [v, v] }]
  # ouput_hash = {"apples"=>"apples", "bananas"=>"bananas", "coconuts"=>"coconuts", "watermelons"=>"watermelons"}

  # Hash to array
  ouput_hash.to_a
  # => [["apples", "apples"], ["bananas", "bananas"], ["coconuts", "coconuts"], ["watermelons", "watermelons"]]
  ```
 * Can you iterate through a hash?
  ```ruby
  arr = ["apples", "bananas", "coconuts", "watermelons"]
  ouput_hash = Hash[arr.collect { |v| [v, v] }]

  ouput_hash.each do |key, value|
    puts "#{key}: #{value}"
  end
  ```
 * You can use Ruby arrays as stacks. What other common data structures do arrays support?
  ```ruby
  # Stack
  stack = []
  stack.push("first")
  stack.push("second")
  puts stack.pop # => "second"

  # Queue
  queue = []
  queue.unshift("first")
  queue.unshift("second")
  queue.unshift("third")
  # => ["third", "second", "first"]
  puts queue.shift # third
  # queue => ["second", "first"]
  ```
 * Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable.
  ```ruby
  # Fill the array
  numbers = []

  for i in 0..15
    numbers.push(i)
  end
  # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
  current_slice = []
  slice_count   = 1

  numbers.each_with_index do |el, i|
    current_slice.push(el)

    if (current_slice.size == 4)
      puts "Slice #{slice_count}: #{current_slice}"
      current_slice.clear
      slice_count += 1
    end
  end

  # Output:
  # Slice 1: [0, 1, 2, 3]
  # Slice 2: [4, 5, 6, 7]
  # Slice 3: [8, 9, 10, 11]
  # Slice 4: [12, 13, 14, 15]
  ```
 * The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure of hashes. You should be able to specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.
  ```ruby
  class Tree
  attr_accessor :children, :node_name

  def initialize(name="", children=[], tree_map={})
    @children = children
    @node_name = name

    build(tree_map)
  end

  def build(tree_map = {})
    unless tree_map.empty?
      @node_name.clear()
      @children.clear()

      if tree_map.length > 1
        raise "Too many root nodes. #{tree_map}"
      end

      node_keys     = tree_map.keys
      @node_name    = node_keys[0]
      node_children = tree_map[node_name]

      node_children.each do | children_name, next_level_children |
        @children.append(Tree.new("", [], { children_name => next_level_children }))
      end
    end
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end
end

map  = { 'grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {} }, 'uncle' => { 'child 3' => {}, 'child 4' => {} } } }
puts map
ruby_tree = Tree.new("", [], map)

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "Visiting entire tree"
ruby_tree.visit_all { |node| puts node.node_name }
```
* Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.
```ruby
def print_help()
  puts "Usage: ruby simple-grep.rb [FILE_NAME] [TEXT]"
end

def print_results(results=[])
  unless results.empty?
    results.each do | line, content |
      puts "#{line}: #{content}"
    end
  else
    puts "No results found."
  end
end

def perform_search(filepath, text)
  puts "Searching for occurrences of \"#{text}\" in #{filepath}..."

  if File.exists?(filepath)
    results = {}

    begin
      File.readlines(filepath).each_with_index do | line_content, line_index |
        if line_content.match(text)
          results[line_index + 1] = line_content
        end
      end
    rescue => exception
      puts exception
    else
      print_results(results)
    end
  else
    puts "The file \"#{filepath}\" doesn't exist."
  end
end

unless ARGV.length < 2
  perform_search(ARGV[0], ARGV[1])
else
  print_help()
end
```
## Day 3: Serious Change
* One of the main nontrivial problems that Ruby solves well is metaprogamming. Metaprogramming means writing programs that write programs.
* Ruby has *open classes*. This means that it's possible to change the definition of a class at any time, usually to add behavior.
```ruby
#Example from the book. This code adds a method blank? to NilClass and String.
 ​​class NilClass​​
 ​​  def blank?​​
 ​​    true​​
 ​​  end​​
 ​​end​​
 ​​​​
 ​​class String​​
 ​​  def blank?​​
 ​​    self.size == 0​​
 ​​  end​​
 ​​end​​
 ​​​​
 ​​["", "person", nil].each do |element|​​
 ​​  puts element unless element.blank?​​
 ​​end​​
```
* It's possible to even redefine Class.new, breaking Ruby. A trade-off for the freedom of having open classes, which could be useful for writing more readable code. However, I think this adds a layer to the design that should be addressed in a planned way, and not ad-hoc way (which can potentially end up breaking the design, the app, and worse, the language!). With great power comes great responsibility.
### Day 3 Self-Study
Modify the CSV application to support an each method to return a CsvRow object. Use method_missing on that CsvRow to return the value for the column for a given heading. For example, for the file:
```ruby
one, two
lions, tigers
```
allow an API that works like this:
```ruby
csv = RubyCsv.new
csv.each {|row| puts row.one} # This should print "lions" .
```
This is my solution:
```ruby
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
    puts "I was included :)"
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    class CsvRow
      def method_missing(name, *args)
        column_name = name.to_s
        @row[column_name]
      end

      def initialize(columns=[], values=[])
        @row   = {}

        if columns.length < 1
          raise "No columns given."
        end

        if values.length < 1
          raise "No values given."
        end

        columns.each_with_index do | column_name, index |
          @row[column_name] = values[index]
        end
      end
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ' )

      file.each do |row|
        @csv_contents << row.chomp.split(', ' )
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

    def each
      @csv_contents.each do |line|
        yield(CsvRow.new(@headers, line))
      end
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each do |csv_row|
  puts csv_row.Column1
end
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

# Should prefer unless over if not.
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