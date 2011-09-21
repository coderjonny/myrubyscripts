a = 102.7
b = 95.1
ObjectSpace.each_object(Float) {|x| p x}
ObjectSpace.each_object(Fixnum) {|x| p x} #produces no output

p r=1..10
list = r.methods
p list.length
p list[0..3]

p r.respond_to?("frozen?")
p r.respond_to?(:has_key?)
p "me".respond_to?("==")

num = 1 
p num.object_id
p num.class
p num.kind_of? Fixnum
p num.kind_of? Numeric
p	num.instance_of? Fixnum
p	num.instance_of? Numeric

klass = Fixnum
begin
	print klass
	klass = klass.superclass
	print " < " if klass
end while klass
puts 
p Fixnum.ancestors

#we can also look at the object's constants, local, and instance variables:
class Demo
	@@var = 99
	CONST = 1.23
	
	private
		def private_method
		end
	protected 
		def protected_method
		end
	public
		def public_method
			@inst = 1
			i = 1
			j = 2
			local_variables
		end
		
	def Demo.class_method
	end
end

p	Demo.private_instance_methods(false)
p	Demo.protected_instance_methods(false)
p	Demo.public_instance_methods(false)
p	Demo.singleton_methods(false)
p	Demo.class_variables
p	Demo.constants(false)

demo = Demo.new
p	demo.instance_variables
#get 'public_method' to return its local variables
#and set an instance variable
p	demo.public_method
p	demo.instance_variables

p	"John Coltrane".send(:length)
p	"Miles Davis".send("sub", /iles/, '.')

trane = "John Coltrane".method(:length)
miles = "Miles Davis".method("sub")

p	trane.call
p	miles.call(/iles/, '.')

#method.call invokes the method to run as if you invoked the orignial object
def double(a)
	2*a
end
method_object = method(:double)
p [1,3,5,7].map(&method_object)

#Method objects are bound to one particular object. you can create unbound methods(of class UnboundMethod)
#and then subsequently binding creates new Method object. As with Aliases, unbound methods are refrences to
#the definition of the method at the time they are created
unbound_length = String.instance_method(:length)
class String
	def length
		99
	end
end
str = "cat"
p	str.length
bound_length = unbound_length.bind(str)
p	bound_length.call


john = %q{"John coltrane".length}
miles = %q{"Miles Davis".sub(/iles/, '.')}
p	eval john
p	eval miles

def get_a_binding
	val = 123
	binding
end
val = "cat"

the_binding =get_a_binding
p eval("val", the_binding)
p eval("val")
