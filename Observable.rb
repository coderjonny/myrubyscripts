require 'observer'
class CheckWaterTemperature #periodically check the water
	include Observable
	def run
		last_temp = nil
		loop do 
			temp = Temperature.fetch #external class..
			puts "Current temperatur: #{temp}"
			if temp != last_temp
				changed 		#notify observers
				notify_observers(Time.now, temp)
				last_temp = temp
			end
		end
	end
end
class Warner
	def initialize(&limit)
		@limit = limit
	end
	def update(time, temp)		#callback for observer
		if @limit.call(temp)
			puts "--- #{time.to_s}: Temp outside rande: #{temp}"
		end
	end
end
checker = CheckWaterTemperature.new
checker.add_observer(Warner.new {|t| t < 80})
checker.add_observer(Warner.new {|t| t > 120})
checker.run