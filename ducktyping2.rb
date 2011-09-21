require 'test/unit'
load 'addcust.rb'
class TestAddCustomer < Test::Unit::TestCase
	def test_add
		c = Customer.new("Ima", "Customer")
		f = ""
		c.append_name_to_file(f)
		assert_equal("Ima Customer", f)
	end
end
class TestAddCustomer < Test::Unit::TestCase
	def test_add
		c = Customer.new("Ima", "Customer")
		f = []
		c.append_name_to_file(f)
		assert_equal(["Ima", " ",  "Customer"], f)
	end
end

def append_song(result, song)
	#test we're given the right parameters
	unless result.respond_to?(:<<)
	fail TypeError.new("'result' needs `<<' capability")
end
unless song.respond?(:artist) && song.respong_to?(:title)
	fail TypeError.new("'song' needs 'artist' and 'title'")
end

result << song.title << " (" << song.artist << ")"
end

result = ""
p append_song(result, song) 