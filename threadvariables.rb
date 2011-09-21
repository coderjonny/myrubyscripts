print <<-thread

Thread Variables 
A thread can normally acess any variables that are in scope when the thread is created.
Variables local to the block containing the thread code are local to the thread and are not 
shared.
But what if you need pet-thread variables that can be accessed by other threads-
including the main thread?
Class Thread seatures a special facility that allows thread-local variables to be created and
accessed by name
The thread object can be treated as if it were a Hash,
writing to elements using []= and reading them back using [].

Here, each thread records the current value of the variable count in a thread-local 
variable with the key mycount. To do this, the code uses the string "mycount" 
when indexing thread objects.
thread

count = 0 
threads = []
20.times do |i|
	threads[i] = Thread.new do
		sleep(rand(0.01))
		Thread.current["mycount"] = count
		count += 1
	end
end
threads.each {|t| t.join; print t["mycount"], ", " }
puts "count = #{count}"

#The main thread waits for the subthreads to finish and then prints out the value of count
#captured by each. the sleep(rand(0.01)) makes each thread wait a random time before recoding the value.

print <<-Threads

Threads and exceptions
Threads

threads = []
4.times do |number|
	threads << Thread.new(number) do |i|
		raise "Boom!" if i == 2
		print "#{i}\n"
	end
end
sleep 1
