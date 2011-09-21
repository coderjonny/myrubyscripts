print <<-hook

A Hook
is a technique that lets you trap some Ruby event, such as object creation. 
Let's take a look at some common Ruby hook techniques.
hook

module Kernel
	alias_method :old_system, :system
	def system(*args)
		result = old_system(*args)
		puts "system(#{args.join(', ')}) returned #{result.inspect}"
		result
	end
end
system("date")
system("kangaroo", "-hop 10", "skippy")

#The problem with this technique is that your;re relying on there not bveing anexisting method called 
#old_system..a better alternatice is to make use of method objects, which are effectievly anonymous:
module Kernel
	old_system_method = instance_method(:system)
	define_method(:system) do |*args|
		result = old_system_method.bind(self).call(*args)
		puts "system(#{args.join(', ')}) returned #{result.inspect}"
		result
	end
end
system("date")
system("kangaroo", "-hop 10", "skippy")

class Object
	attr_accessor :timestamp
end

class Class
	old_new = instance_method :new
	define_method :new do |*args, &block|
		result = old_new.bind(self).call(*args, &block)
		result.timestamp = Time.now
		result
	end
end

class Test
end

obj1 = Test.new
sleep(0.5)
obj2 = Test.new

p obj1.timestamp.to_f
p obj2.timestamp.to_f

def dump_call_stack
	file_contents = {}
	puts "File			Line Source Line"
	puts "--------------+----+-----------"
	caller.each do |position|
		next unless position =~ /\A(.*?):(\d+)/
		file = $1
		line = Integer($2)
		file_contents[file] ||= File.readlines(file)
		printf("%-15s:%3d - %s", File.basename(file), line, 
			file_contents[file][line-1].1strip)
		end
	end
	
