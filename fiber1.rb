require 'fiber'
consumer = Fiber.new do |producer, queue|
	5.times do
		while queue.size > 2
			queue = producer.transfer(consumer, queue)
		end
		puts "consume #{queue.shift} and #{queue.shift}"
	end
end
producer = Fiber.new do |consumer, queue|
	value = 1
	loop do 
		puts "producing more stuff"
		3.times {queue << value; value +=1}
		puts "queue size is #{queue.size}"
		consumer.transfer queue
	end
end

consumer.transfer(producer, [])

