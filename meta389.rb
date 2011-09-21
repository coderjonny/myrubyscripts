class AttrLogger
	def self.attr_logger(name)
		attr_reader name
		define_method("#{name}=") do |val|
			puts "Assigning #{val.inspect} to #{name}"
			instance_variable_set("@#{name}", val)
		end
	end
end
class Example < AttrLogger
	attr_logger :value
end
ex = Example.new
ex.value = 123
puts "Value is #{ex.value}"
ex.value = "cat"
puts "value is now #{ex.value}"