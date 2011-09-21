class Person < Struct.new(:name, :address, :likes)
	def to_s
		"#{self.name} lives in #{self.address} and like #{self.likes}"
	end
end
dave = Person.new('Dave', 'Texas')
dave.likes = "programming languages"
puts dave