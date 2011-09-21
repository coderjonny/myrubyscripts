module AttrLogger
	def attr_logger(name)
		attr_reader name
		define_method("#{name}=") do |val|
			puts "Assigning #{val.inspect} to #{name}"
			instance_variable_set("@#{name}", val)
		end
	end
end
class Example
	extend AttrLogger
	attr_logger :value
end
ex = Example.new
ex.value = 123
puts "Value is #{ex.value}"
ex.value = "cat"
puts "value is now #{ex.value}"

module GeneralLogger
	#instance method to be added to any class that includes us
	def log(msg)
		puts Time.now.strftime("%H:%M: ") + msg
	end
	#module containing class methods to be added
	module ClassMethods
		def attr_logger(name)
			attr_reader name
			define_method("#{name}=") do |val|
				log "Assigning #{val.inspect} to #{name}"
				instance_variable_set("@#{name}", val)
			end
		end
	end
	#extend host class with class methods when we're included
	def self.included(host_class)
		host_class.extend(ClassMethods)
	end
end
class Example
	include GeneralLogger
	attr_logger :value
end
ex = Example.new
ex.log("New Example created")
ex.value = 123
puts "Value is #{ex.value}"
ex.value = "cat"
puts "Value is #{ex.value}"

