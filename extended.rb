#extended
module A
	def A.extended(obj)
		puts "#{self} extending '#{obj}'"
	end
end
p "cat".extend(A)

#include
def include(*modules)
	modules.reverse_each do |mod|
		mod.append_features(self)
		mod.included(self)
	end
end

#included
module A
	def A.included(mod)
		puts "#{self} included in #{mod}"
	end
end

module Enumerable
include A
end

#method_added
module Chatty
	def Chatty.method_added(id)
		puts "Adding #{id.id2name}"
	end
	def one() end
end
module Chatty
	def two() end
	def okayyyyyyy() end
	def thisMethod() end
end

#method_removed
module Chatty
	def Chatty.method_removed(id)
		puts "removing #{id.id2name}"
	end
	def one() end
end
module Chatty
	remove_method(:one)
end

#method_undefined
print <<-undefined


What does method_undefined do?
undefined

gets
puts "invoked as a callback whenever a method is undefined in the receiver.\n\n"

module Chatty
	def Chatty.method_undefined(id)
		puts "Undefining #{id.id2name}"
	end
	def one() end
end
module Chatty
	undef_method(:one)
end

#module function
print <<-function

What is module_function?
function
gets
print <<-function
Creates module functions for the named methods. These functions may be called with the module 
as a receiver and are available as instance methods to classes that mix in the module. Module 
functions are copies of the original and so may be changed independently. The instance-method
versions are made private. if used with no arguments, subsequently defined
methods become module functions.
function

module Mod
	def one
		"this is one"
	end
	module_function :one
end
class Cls
	include Mod
	def call_one
		one
	end
end

p Mod.one
c = Cls.new
p c.call_one
module Mod
	def one
		"this is the new one"
	end
end
p Mod.one
p c.call_one

#private
puts"\nwhat is private?"
gets
print <<-private

with no arguments, sets the default visibilty for subsequently defined methods to private.
With arguments, sets the named methods to have private visibility. See "access control" 
starting on page 350.

private
module Mod
	def a() end
	def b() end
	private
	def c() end
	private :a
end
Mod.private_instance_methods

puts "\nwhat is undef_method?"
gets
#undef_method
class Parent
	def hello
		puts "in parent"
	end
end
class Child < Parent
	def hello
		puts "in child"
	end
end
c = Child.new
p c.hello
class Child
	remove_method :hello #remove from child, still in parent tho
end
p c.hello
class Child
	undef_method :hello # prevent any calls to 'hello'
end
p c.hello
