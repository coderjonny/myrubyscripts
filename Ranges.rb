#Ruby uses ranges to implement three seperate features: sequences, 
#conditions, and intervals

class Pwr2
	attr_reader :value
	def initialize(value)
		@value = value
	end
	def <=>(other)
		@value <=> other.value
	end
	def succ 
		Pwr2.new(@value + @value)
	end
	def to_s
		@value.to_s
	end
end
p1 = Pwr2.new(4)
p2 = Pwr2.new(32)

puts (p1..p2).to_a

