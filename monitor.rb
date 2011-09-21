require 'monitor'
require 'mathn'
numbers = []
numbers.extend(MonitorMixin)
number_added = numbers.new_cond
#reporter thread
consumer = Thread.new do
	5.times do
		numbers.synchronize do
			number_added.wait_while{numbers.empty? }
			puts numbers.shift
		end
	end
end
# Prime umber generator thread
generator = Thread.new do
	p = Prime.new
	5.times do
		numbers.synchronize do
			numbers << p.succ
			number_added.signal
		end
	end
end
generator.join
consumer.join

