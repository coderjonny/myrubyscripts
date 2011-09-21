module Test
	State = {}
	def state=(value)
		State[object_id] = value
	end
	def state
		State[object_id]
	end
end

class Client
	include Test
end

c1 = Client.new
c2 = Client.new
c1.state = 'dog'
c2.state = 'cat'

p c1.state
p c2.state

p c1.class