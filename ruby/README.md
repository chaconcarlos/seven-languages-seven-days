# Seven languages in seven weeks: Ruby
## Day 1: Finding a Nanny
* __Ruby is an interpreted, object-oriented, dynamically typed language from a family of so-called scripting languages.__
* Interpreted means that Ruby code is executed by an interpreter rather than a compiler. 
* Dynamically typed means that types are bound at execution time rather than compile time. In general, the trade-off for such a strategy is flexibility versus execution safety.
* Object-oriented means the language supports encapsulation (data and behavior are packaged together), inheritance through classes (object types are organized in a class tree), and polymorphism (objects can take many forms). Ruby is a pure object-oriented language.
 * Ruby is not hugely efficient in terms of execution speed, but it makes programmers very productive.

## Day 1 Self-Study

* [The Ruby API](https://rubyapi.org/) 
* [The free online version of Programming Ruby: The Pragmatic Programmer’s Guide [TFH08]](https://ruby-doc.com/docs/ProgrammingRuby/) 
 * A method that substitutes part of a string:

 ```ruby
 sentence = "My name is Carlos"
 sentence.sub! 'Carlos', 'Jose'
puts sentence #prints "My name is Jose"
```
* Ruby’s regular expressions
 ```ruby
# Find the word ''
"One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin." =~ /horrible/
#Outputs: 105
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
###