"cat".instance_eval do
	puts "Upper case = #{upcase}"
	puts "Length is #{self.length}"
end

"cat".instance_eval('puts "Upper=#{upcase}, length=#{self.length}"')

class MyClass
end
MyClass.class_eval do
	def instance_method 
		puts "in an instance method"
	end
end
obj = MyClass.new
obj.instance_method

class MyClass
end
MyClass.instance_eval do
	def class_method
		puts "In a class method"
	end
end
MyClass.class_method

animal = "cat"
"dog".instance_exec(animal) do |other|
	puts "#{other} and #{self}"
end


module One
	CONST = "Defined in One"
	def self.eval_block(&block)
		instance_eval(&block)
	end
end
module Two
	CONST = "Defined in Two"
	def self.call_eval_block
		One.eval_block do
			puts CONST
		end
	end
end
Two.call_eval_block













