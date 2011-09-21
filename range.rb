class Xs
	include Comparable 
	attr :length
	def initialize(n)
		@length = n
	end
	def succ 
		Xs.new(@length + 1)
	end
	def <=>(other)
		@length <=> other.length
	end
	def inspect
		'x' * @length
	end
end

p	r = Xs.new(3)..Xs.new(6)
p	r.to_a
p	r.member?(Xs.new(5))

case 63.23
	when 1...50 then puts "low"
	when 50...100 then puts "high"
end

p	(1..10).cover?(0)
p	(1..10).cover?(1)
p	(1..10).cover?(10)
p	(1...10).cover?(10)
p	(1...10).cover?(100)

range = Xs.new(1)..Xs.new(10)
range.step(2) {|x| p x}
enum = range.step(3)
p enum.to_a
