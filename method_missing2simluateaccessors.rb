#method_missing to simulate accessors
require 'ostruct'
obj = OpenStruct.new(name: "Dave")
obj.address = "Texas"
obj.likes	= "Programming"
puts "#{obj.name} lives in #{obj.address} and likes #{obj.likes}"

class MyOpenStruct < BasicObject
	def initialize(initial_values = {})
		@values = initial_values
	end
	def _singleton_class
		class << self
			self
		end
	end
	def method_missing(name, *args, &block)
		if name[-1] == "="
			base_name = name[0..-2].intern
			_singleton_class.instance_exec(name) do |name|
				define_method(name) do |value|
					@values[base_name] = value
				end
			end
			@values[base_name] = args[0]
	else 
		_singleton_class.instance_exec(name) do |name|
			define_method(name) do
					@values[name]
				end
			end
			@values[name]
		end
	end
end

obj = MyOpenStruct.new(name: "Dave")
obj.address = "Texas"
obj.likes	= "Programming"
puts "#{obj.name} lives in #{obj.address} and likes #{obj.likes}"

p BasicObject.instance_methods

obj_new = obj.dup
obj_new.name = "mikey"
obj_new.address = "Colorado"
#can't duplicate
#although BasicObject seems like a natural fit for method_missing, 
#you may find it to be more trouble than it's worth






