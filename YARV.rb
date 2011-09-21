require 'yaml'
class Special
	def initialize(valuable, volatile, precious)
		@valuable = valuable
		@volatile = volatile
		@precious = precious
	end
	def to_yaml_properties
		%w{ @precious @valuable}
	end
	def to_s
		"#@valuable #@volatile #@precious"
	end
end
obj = Special.new("hello", "there", "world")

puts "Before: obj = #{obj}"
data = YAML.dump(obj)
obj = YAML.load(data)
puts "After: obj = #{obj}"

#we can look at what YAML creates as the serialized form of the object- it's pretty simple:
obj = Special.new("Hello", "there", "World")
puts YAML.dump(obj)
