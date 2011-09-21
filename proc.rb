add_three_numbers = lambda {|a,b,c| a+ b +c}
add_10_to_two_numbers = add_three_numbers.curry[10]
add_33_to_one_number =   add_10_to_two_numbers[23]

add_three_numbers[1,2,3]
add_33_to_one_number[1]
add_10_to_two_numbers[1,2]

variable =123
prc = lambda {"some proc"}
p prc.source_location

def create_proc
	Proc.new
end

p my_proc = create_proc {"hello"}
p my_proc.to_s
