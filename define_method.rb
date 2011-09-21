class A
	define_method(:fred) {puts "In Fred"}
	def create_method(name, &block)
		self.class.send(:define_method, name, &block)
	end
	define_method(:wilma) {puts "charge it!"}
end
class B < A
	define_method(:barney, instance_method(:fred))
end

b = B.new
b.barney
b.wilma

b.fred
b.create_method(:betty) {p self}
b.betty
b.create_method(:bitch) {p "bitch!"}
b.bitch

class Silly
	define_method("Oh !@!!") {puts "as Snoopy says"}
end
Silly.new.send("Oh !@!!")


#extend_object
module Picky
	def Picky.extend_object(o)
		if String === o 
			puts "Can't add Picky to a string"
		else
			puts "picky added to #{o.class}"
			super
		end
	end
end
(s = Array.new).extend Picky
(s = "quick brown fox").extend Picky
Picky.extend Picky
