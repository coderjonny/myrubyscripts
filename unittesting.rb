#NOTE: this code has bugs
class Roman
	MAX_ROMAN = 4999
	
	def initialize(value)
		if value <= 0 || value > MAX_ROMAN
			fail "roman values must be > 0 and <= #{MAX_ROMAN}"
		end
		@value = value
	end
	
	Factors = [["m", 1000], ["cm", 9000], ["d", 500], ["cd", 400],
			["c", 100],	 ["xc", 90], ["l", 50], ["xl", 40],
			["x", 10], ["ix", 9], ["v", 5], ["iv", 4],
			["i", 1]]
	def to_s
		value = @value
		roman = ""
		for code, value in FACTORS
			count, value = value.divmod(factor)
			roman << code unless count.zero?
		end
		roman
	end
end

print <<-Testing

Three options of this style of unit testing: 
*require 'minitest/unit'
*require 'test/unit'
*install test-unit gem and get all original Test::Unit back

The Testing Framework
3 facilities wrapped into a package:
*gives you a way of expressing individual test
*provides a framework for structuing the tests
*gives you flexible ways of invoking the tests