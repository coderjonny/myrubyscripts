class Square
	def area
		@side * @side
	end
	def initialize(side)
		@side = side
	end
end

area_unbound = Square.instance_method(:area)

s = Square.new(12)
area = area_unbound.bind(s)
p area.call

class Test
	def test
		:original
	end
end
um = Test.instance_method(:test)
class Test
	def test
		:modified
	end
end
t = Test.new
p t.test
p um.bind(t).call

class A
	def test
		puts "In Test, class = #{self.class}"
	end
end
class B < A
end
class C < B
end
um = B.instance_method(:test)
bm = um.bind(C.new)
bm.call
bm = um.bind(B.new)
bm.call
#bm = um.bind(A.new) #you will get error
#bm.call

um = String.instance_method(:upcase)
p um.name

um = String.instance_method(:upcase)
um.owner

