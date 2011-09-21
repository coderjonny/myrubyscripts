#60 = 2 **2 * 3 * 5

require'prime'

p 60.prime?
p 60.prime_division

require 'prime'
#This class handles parser events, extracting
#comments and attaching them to class definitions
Prime.each {|p| puts p; break if p > 20}

require 'ripper'
		@comment << comment.sub(/^\s*#\s*/, " ")
		output
	end
	def on_kw(name, output)
		@expecting_class_name = (name == 'class')
		output
	end
	def on_const(name, output)
		if @expecting_class_name
			output << "#{name}:\n"
			output << @comment
		end
		reset_state
		output
	end
	private
	def reset_state
		@comment = " "
		@expecting_class_name = false
	end
end
BabyRDoc.new(File.new(__FILE__)).parse(STDOUT)

require 'singleton'

class Myclass
	
	attr_accessor :data
	include Singleton
end
a = MyClass.instance
b = MyClass.instance

a.data = 123
b.data