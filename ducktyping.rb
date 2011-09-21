require 'test/unit'
load 'addcust.rb'

class TestAddCustomer < Test::Unit::TestCase
	def test_add
		c= Customer.new("Ima", "Customer")
		f = File.open("tmpfile", "w") do |f|
			c.append_name_to_file(f)
		end
		f = File.open("tmpfile") do |f|
			assert_equal("Ima Customer", f.gets)
		end
	ensure
		File.delete("tmpfile") if File.exist?("tmpfile")
	end
end
