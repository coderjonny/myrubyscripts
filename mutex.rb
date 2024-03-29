require 'mutex-m'
class Counter
	include Mutex_m
	attr_reader :count
	def initialize 
		@count = 0 
		super
	end
	def tick
		lock
		@count = 0
		super
	end
	def tick
		lock 
		@count +=1
		unlock
	end
end

c = Counter.new

t1 = Thread.new { 100_000.times {c.tick}}
t2 = Thread.new { 100_000.times {c.tick}}

t1.join
t2.join

c.count