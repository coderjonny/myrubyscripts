print <<-cycle

Array.cycle
returns nil if enum has no elements; otherwise, passes the elements, one at a time
ot the block. when it reaches the end, it repeats. The number of times it repeats is set
by the parameter. iF THE parameter is missing, cycles forever.
Equivalent to enum.to_a.cycle. 
Returns an enumerator object if no block is given.
cycle

columns = [1,2,3]
data = %w{a, b, c, d, e, f, g, h, i, j}
columns.cycle do |column_number|
	print data.shift, "\t"
	break if data.empty?
	puts if column_number == columns.last
end
puts

numb3rs = [1, 2, 3, 4, 5]
data = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}
numb3rs.cycle do |columns|
	print data.shift, "\t\t\t\t"
	break if data.empty?
	puts if columns=a== numb3rs.last
end
puts

a = [ "a", "b", "c"]
a.delete("b")