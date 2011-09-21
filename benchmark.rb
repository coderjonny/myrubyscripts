require 'benchmark'
include Benchmark

LOOP_COUNT = 1_000_000

bmbm(12) do |test|
	test.report("inline:") 	do
		LOOP_COUNT.times do |x|
			#NOTHING
		end
	end
	test.report("method:") do
		def method
			#nothing
		end
		def something
		end
		def worthless
		end
		
		LOOP_COUNT.times do |x|
			method
		end
	end
end
