require 'pp'
Customer = Struct.new(:name, :sex, :dob, :country)
cust = Customer.new("Walter Wall", "Mall", "12/25/1960", "Niue")
puts "Regular print"
p cust
puts "\nPretty print"
pp cust

require 'pp'
a = "string"
b = [a]
c = [b, b]
PP.sharing_detection = false
pp c
PP.sharing_detection = true
pp c

hottie = Struct.new(:name, :sex, :dob, :country)
yi = hottie.new("yi choi", "sexykoreangirl", "old enough", "korea")
loop do 
	sleep(2)
	pp "pretty print pleaseeeeeeee"
	pp yi
	end