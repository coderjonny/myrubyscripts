Person = Struct.new(:name, :address, :likes)
dave = Person.new('Dave', 'TX')
dave.likes = "Programming Languages"
puts dave

Person = Struct.new(:name, :address, :likes)
class Person
	def to_s
		"#{self.name} lives in #{self.address} and likes #{self.likes}"
	end
end
