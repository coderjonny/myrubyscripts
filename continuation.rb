#does a nonlocal exit when a condition is met
require 'continuation'
callcc do |cont|
	for i in 0..4
		print "\n#{i}: "
		for j in i*5...(i+1)*5
			cont.call() if j == 7
			printf "%3d", j
		end
	end
end
print "\n"

#The call stack for methods is preserved in continuations;
require 'continuation'
def strange
	callcc {|continuation| return continuation}
	print "Back in method, "
end
print "Before method."
continuation = strange()
print "After method."
continuation.call if continuation
puts '\n'
require 'csv'
CSV(STDOUT, col_sep: "|") do |csv|
	csv << [1, "line 1", 27]
	csv << [2, nil, 123]
	csv << [3, "|bar|", 32.5]
end
