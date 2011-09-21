class Test
	attr_reader :name, :likes
	def initialize(name, likes)
		@name = name
		@likes = likes
	end
end
d = Test.new("jonny", "Ruby")
p d.likes
