class Droozy
	def sleepy
		sleep(rand(2))
	end
	def square(n)
		n**rand(3)
	end
	def okay
		loop do
			sleepy
			meth = self.method(:square)
			meth.call(10)
	puts "**#{[rand(100), rand(100), rand(100)]}**#{[5,10].collect(&meth)}***#{Time.now}"
	end
end
end

new = Droozy.new
new.okay



