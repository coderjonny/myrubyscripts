class Example
end
ex = Example.new

some_class = Class.new
puts some_class.class

#if you pass Class.new a block, that block is used as the body of the class:
some_class = Class.new do
	def self.class_method
		puts "In class method"
	end
	def instance_method
		puts "In instance method"
	end
end
some_class.class_method
obj = some_class.new
obj.instance_method

 some_class = Class.new(String) do
	 def vowel_movement
		 tr 'ai', '*'
	 end
 end
 
 obj = some_class.new("now is the mothafuckin time to code!")
 puts obj.vowel_movement
 
 something = Class.new
 obj  = something.new
 puts "initial name is #{something.name}"
 Somethangelse = something
 puts "then the name is #{something.name}"
 puts "also works via the object: #{obj.class.name}"
 
 #simple reimplementation of Ruby Srtuct class:
 def MyStruct(*keys)
	 Class.new do 
		 attr_accessor *keys
		 def initialize(hash)
			 hash.each do |key,value|
				 instance_variable_set("@#{key}", value)
end
		 end
	 end
 end
 Person = MyStruct :name, :address, :likes
 dave = Person.new(name: "dave", address: "TX", likes: "programming")
 chad = Person.new(name: "chad", likes: "jazz")
 chad.address = "CO"
 puts "Dave's name is #{dave.name}"
 puts "Chad lives in #{chad.address}"
 
 
 
 
 