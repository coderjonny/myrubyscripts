require 'profile'
count = 0
words = File.open("C:/Users/Jean/Desktop/testfile")
while word = words.gets
	word = word.chomp!
if word.length == 12
	count += 1 
end
end
