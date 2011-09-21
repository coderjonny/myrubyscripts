def power(x, y)
	result = 1
	while n.nonzero?
		if n[0].nonzero?
			result *= x
			n -= 1
		end
		x *=x
		n /= 2
	end
	return result
end

def f(x)
  return Math.sqrt(x.abs) + 5*x ** 3
end
 
Array.new(11) { gets.to_i }.reverse.each do |x|
  y = f(x)
  puts "#{x} #{(y > 400) ? 'TOO LARGE' : y}"
end

