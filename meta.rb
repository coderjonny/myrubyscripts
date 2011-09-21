class Test
	def one
		@var = 99
		two
	end
	def two 
		puts @var
	end
end
p t = Test.new
p t.one

class Test
	puts "In the definition of class Test"
	puts "self = #{self}"
	puts "Class of self = #{self.class}"
end

class Test
	@var = 99
	def self.value_of_var
		@var
	end
end
puts Test.value_of_var

animal = "cat"
puts animal.upcase.reverse

def animal.speak
	puts "Then #{self} says miaow"
end
animal.speak
puts animal.upcase

class Dave
	def self.class_method_one
		puts "Class method one"
	end
	def Dave.class_method_one
		puts "Class method one overwritten using self!?"
	end
	def Dave.class_method_two
		puts "Class method two"
	end
end

Dave.class_method_one
Dave.class_method_two

class Test
	@var = 99
	def self.var
		@var
	end
	def self.var=(value)
		@var = value
	end
end
puts "\n\n\noriginal value = #{Test.var}"
Test.var = "cat"
puts "New value = #{Test.var}"



animal = "dog"
class << animal
	def speak
		puts "The #{self} says woof!"
	end
end
animal.speak

animal = "dog"
def animal.speak
	puts "the #{self} says woof!"
end
singleton = class << animal
	def lie
		puts "The #{self} lies down!"
	end
	self #<<return singleton class object
end

animal.speak
animal.lie
puts "\n\n\nsingleton class object is #{singleton}"
puts "it defines methods #{singleton.instance_methods - 'cat'.methods}"

print <<-okay

Ruby alreadu has attr_accessor, which defines getter and setter methods. 
normally, thought, these are defined as instance methods and hence will access
values stored in instances of a class. To make them work with class-level 
instance variable, we have to invoke attr_accessor in the singleton class:
okay

class Test
	@var = 99
	class << self
		attr_accessor :var
	end
end
puts "Original value = #{Test.var}"
Test.var = "cat"
puts "New value = #{Test.var}"

#Inheritance and Visibility
class Base
	def a_method
		puts "Got here"
	end
	private :a_method
end
class Derived1 < Base
	public :a_method
end

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#same shit as this
#class Derived1 < Base
#	def a_method(*)
#		super
#	end
#	public :a_method
#end

class Derived2 < Base
end

pub = Derived1.new
pub.a_method
pub.a_method


module Logger
	def log(msg)
		STDERR.puts Time.now.strftime("%H:%M:%S: ") + "#{self} (#{msg})"
	end
end
class Song
	include Logger
end
class Album
	include Logger
end
s = Song.new
s.log("created")

module Mod
	def greeting
		"Hello"
	end
end
class Example
	include Mod
end
ex = Example.new
puts "before, change, greeting is #{ex.greeting}"
module Mod
	def greeting
		"hi"
	end
end
puts "after change, greeting is #{ex.greeting}"

puts "\n\nextend method useful when adding the instance methods to 
a particular object. you do this using Object#extend."

module Humor
	def tickle
		"#{self} says hee, hee!"
	end
end

obj = "Grouchy"
obj.extend Humor
puts obj.tickle
H = "sleepy"
H.extend Humor
puts H.tickle

#adding a module's methods at the class level:
module Humor
	def tickle
		"#{self} says hee, hee!"
	end
end
class Grouchy
	extend Humor
end
puts Grouchy.tickle

#Metaprogramming Class-level Macros

class Example
	def self.add_logging
		def log(msg)
			STDERR.puts Time.now.strftime("%H:%M:%S: ") + "#{self}(#{msg})"
		end
	end
	add_logging
end
ex = Example.new
ex.log("hello")


class Logger
	def self.add_logging
		def log(msg)
			STDERR.puts Time.now.strftime("%H:%M:%S: ") + "#{self} (#{msg})"
		end
	end
end
class Example < Logger
	add_logging
end
ex = Example.new
ex.log("hello")
