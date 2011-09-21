class Logger
	def self.add_logging(id_string)
		define_method(:log) do |msg|
			now = Time.now.strftime("%H:%M:%S")
			STDERR.puts "#{now}-#{id_string}: #{self} (#{msg})"
		end
	end
end
class Song < Logger
	add_logging "tune"
end
class Album < Logger
	add_logging "CD"
end
song= Song.new
song.log "rock on"
