counts = Hash.new(0)
File.foreach("testfile") do |line|
	line.scan(/\w+/) do |word|
		word = word.downcase
		counts[word] += 1
	end
end
counts.keys.sort.each{|k| print "#{k}:#{counts[k]} "}

#this code is messy because it conflates the concepts of finding words with the counting of the words.

#we could fix this by writing a method that reads the file and yields each successive word
#but fibers give us a simpler solution

puts "\n\nwrote a method that reads the file and yield each successive word"

words = Fiber.new do
	File.foreach("testfile") do |line|
		line.scan(/\w+/) do |word|
			Fiber.yield word.downcase
		end
	end
end
counts = Hash.new(0)
while word = words.resume
	counts[word] += 1
end
counts.keys.sort.each {|k| print "#{k}:#{counts[k]} "}

print <<-fiber

The constructor for the Fiber class takes a block asnd returns a fiber object.
for  not the code in the block is not executed.
We can call the resume on the fiber object.
this causes the block to start the execution. the file is opened.
and the 'scan' method starts extracting indiviual words. then Fiber.yield is invoked.

when the fiber ends out of words in the file, the clock exits.
the next time resume is called, it returns nil.

fibers are often used to generate values from infinite sequences on demand.
Here's a fiber that returns successive integers divisible by 2 and not divisible by 3.
fiber

twos = Fiber.new do
	num = 2
	loop do
		Fiber.yield(num) unless num % 3 == 0 
		num += 2
	end
end

10.times {print twos.resume, " "}

puts "\npress enter."
uh4 = Fiber.new do
	num = 100	
	loop do
	Fiber.yield(num) unless gets =~ /w/
	6.times {print num}
	num *= 10
end
end

10.times {print uh4.resume, " "}
puts "looks like the honda motorcyle logo right??"

print <<-fiber

Because fibers are objects, you can pass them around, store them in variables,
and so on. 
Fibers can be resumed only in the thread that created them.

PAGE 745
The Fiber class that is built into Ruby provides a generator like capibility.
fibers may be created and resumed from some controlling program. if you want to exten the Fiber
class to provide full, symmetrical coroutines, you need first to require the fiber library.
this adds two instance methods, transfer and alive? to Fiber objects, and
the singleton method current to the Fiber class.
fiber

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

print <<-fiber

The fiber library addes full coroutine support, once its loaded, fibers gain a transfer method,
allowing them to transfer control to arbitrary other fibers.
A related but more general mechanism is the continuation. A continuation is a way of
recording the state of your running program(where it si, the current binding, and so on)
and then resuming from that state at some point in the future.
you can use continuations to implement coroutines (and other new control structues)
continuations have also been used to store the state of a running web app between requests
a continuation is created whent he app sends a response to the browser coninuation is
invoked adn app continues from where it left off.
fiber



