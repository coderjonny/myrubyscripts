 code_words = {
   'starmonkeys' => 'Phil and Pete, those prickly chancellors of the New Reich', 
   'catapult' => 'chucky go-go', 'firebomb' => 'Heat-Assisted Living', 
   'Nigeria' => "Ny and Jerry's Dry Cleaning (with Donuts)",
   'Put the kabosh on' => 'Put the cable box on'
 }

require 'wordlist'

# Get evil idea and swap in code words
print "Enter your new idea: " 
idea = gets
code_words.each do |real, code| 
 idea.gsub!( real, code )
end

# Save the jibberish to a new file
print "File encoded.  Please enter a name for this idea: " 
idea_name = gets.strip
File::open( "idea-" + idea_name + ".txt", "w" ) do |f|
 f << idea
end
