require 'profile'
words = File.read("C:/Users/Jean/Desktop/testfile")
count = words.scan(/^...........\n/).size
puts "#{count} twelve-character words"