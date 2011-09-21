class Shipping
	@children = []
	def self.inherited(child)
		@children << child
	end
	def self.shipping_options(weight, international)
		@children.select {|child| child.can_ship(weight, international)}
	end
end
class MediaMail < Shipping
	def self.can_ship(weight, international)
		!international
	end
end
class FlatRatePriorityEnvelope < Shipping
	def self.can_ship(weight, international)
		weight < 64 && !international
	end
end
class InternationalFlatRateBox < Shipping
	def self.can_ship(weight, international)
		weight < 9 *16 && international
	end
end
puts "shipping 16oz domestic"
puts Shipping.shipping_options(16, false)
puts "\nshipping 90oz domestic"
puts Shipping.shipping_options(90, false)
puts "\nShipping 16oz international"
puts Shipping.shipping_options(16, true)

#method_missing hook
def method_missing(name, *args, &block)
	puts "Called #{name} with #{args.inspect} and #{block}"
end
wibble
wobble 1, 2
wurble(3, 4) {stuff}


	