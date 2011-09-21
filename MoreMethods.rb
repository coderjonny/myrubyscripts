print <<-More
	
	More about Methods chap 8
	Defining a Method
	A method is defined using the keyword def. Method names
	should begin with a lowercase letter or underscores. 
	A method name may end with one of ? ! or = Methods that return a 
	boolean result ( so-called predicate methods) are often named 
	with a trailing ?:
	1.even?
	2.even?
	1.instance_of?(Fixnum)
	Methods that are 'dangerous' or that modify their reciever, may be [
	named with
	a trailing exclamation mark, !. these are sometimes called bang methods
	chop returns a modified string
	chop! modifies the receiver in place.
	
	Methods that can appear on the left side of an assignment 
	(a feature we discussed on page 34) end with an equals sign (=).
	
	?, !, and = are weird characters allowed as method name suffixes.
	More

def my_new_method(arg1, arg2, arg3) #3 arguments
	#code for the methos would go here
end
def my_other_new_method                #no arguments
	#code for the method would go here
end

#Ruby lets you specify default values for a method's arguments-values that
#will be used if the caller doesn't pass them explicitly. you do this using
#an equals sign (=) followed by a Ruby expression. That expression can
#include references to previous arguments in the list

def cool_dude(arg1="Nary", arg2="Jonathan")
	"#{arg1}, #{arg2}."
end

p cool_dude
p cool_dude("Bart")
p cool_dude("Bart", "Elwood")

def surround(word, pad_width=word.length/2)
	"[" * pad_width + word + "]" * pad_width
end

puts "\n"
p surround("elephant")
p surround("fox")
p surround("fox", 10)

print <<-pass

	Variable_length Argument lists
	what if you want to pass in a variable number of arguments 
	or want to capture multiple arguments into a single parameter? 
	pacting an asterisk before the name of the parameter
	after the "nomal" parameters lets you do just that.
	this is sometimes called splatting an argument.
	pass
	
def varargs(arg1, *rest)
	"arg1=#{arg1}. rest=#{rest.inspect}"
end

p varargs("one")
p varargs("one", "two")
p varargs "one", "two", "three"

print <<-pass

	the first argument is assigned to the first method parameter as usual. 
	then the next parameter is prefixed with an asterisk, so all the remaining
	arguments are bundled into a new Array, which is then assigned to that 
	parameter
	
	Rubyists sometimes use splat to specify arguments that are not used by
	the method but that are perhaps used by the corresponding method in 
	a superclass.
	pass
	
	#we call super with no parameters. this is is a special case that means "invoke this method i the superclass, passing it
	# all the parameters that were given to the original method.")
class Parent
	def something
	end
end

class Child < Parent
	def do_something(*not_used)
		#our processing
		super
	end
end

class Child < Parent
	def do_something(*)
		super
	end
end

	#in Ruby 1.90,
	#you can put the splat argument anywhere in a method's parameter list, allowing you to write this
def split_apart(first, *splat, last)
	puts "First: #{first.inspect}, splat: #{splat.inspect}, " +
		"last: #{last.inspect}"
end
p split_apart(1,2)
p split_apart(1,2,3)
p split_apart(1,2,3,4)

#if you cared only about the first and last parameters, you could define this method using this:
def split_apart(first, *, last)
#..
end
	
#you can only have one splat argument in a method
#if you had two, it would be ambiguous
#you also can't put arguments with default values after the splat argument.
#in all cases, the splat argument receives the values left over after assigning 
#to the regular argument.

print <<-method

	Methods and Blocks
	As we discussed in the section on blocks and iterators beginning on page 54,
	when a method is called, it may be associated with a block.
	method
def double(p1)
	yield(p1*2)
end

p double(3) {|val| "I got #{val}"}
p double("tom") {|val| "Then I got #{val}" }

#however , if the last parameter in a method definition is prefixed with an ampersand
#any associated block uis converted to a Proc objcect, and that object is assigned to the parameter
#this allows you to store the block for use later.

class TaxCalc
	def initialize(name, &block)
		@name, @block = name, block
	end
	def get_tax(amount)
		"#@name on #{amount} = #{ @block.call(amount) }"
	end
end

tc = TaxCalc.new("sales tax") {|amt| amt * 0.075}
p tc.get_tax(100)
p tc.get_tax(250)


print <<-call

	optionally specifying a receiver
	giving the name of the method
	passing some parameters and an optional block.
	
	connection.download_mp3("gangstaRap") {|p|show_progress(p) }
	
	in this example the object connections is the receiver, download_mp3 is the name
	of the method 
	the string "jitterbug" is the parameter,
	the stuff between the braces is the assiociated block.
	during this method call, Ruby first sets self to the receiver and then 
	invokes the method in that object: for class and module methods, the
	receiver will be the class or module name.
	call
	
p Math.sin(Math::PI/4)



























