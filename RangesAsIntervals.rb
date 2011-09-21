#ranges as intervals
print <<-ranges
	An interval test is seeing whther some value falls within the 
	interval represented by the range. We do this using ===, the
	cas equality operator: \n\tI love here documents.
	ranges

p (1..10) === 5
p (1..10) === 15
p (1..10) === 3.14159
puts ('a'..'j') === 'c'
puts ('a'..'j') === 'z'

#case statements:
puts "\nhow old is your car?"
	car_age = gets.to_f
	case car_age
	when 0...1
		puts "mmm..new car smell"
	when 1...3
		puts "nice"
	when 3...6
		puts "ok"
	else 
		puts "vintage gem"
	end
	
	hmm = gets.to_f
	case hmm
		when 0...10
		puts "thanks for the grade"
		else
		puts "WTF!"
		end
		
		