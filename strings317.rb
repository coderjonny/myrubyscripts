print <<HERE
Double quoted \
here document.
It is #{Time.now}
HERE

print <<-'THERE'
this is single quoted.
The above used #{Time.now}
THERE

puts 'Con' "cat" 'en' "ate" 

3.times do 
	print 'hello'.object_id, " "
end

arr = %w(hey!\tIt is now -#{Time.now}-)
p arr
arr = %W(hey!\tIt is now -#{Time.now}-)
p arr

#Hashes
#a literal Ruby Hash is created by placeing a list of key/value parirs between
#braces. Keys and values can be separated by the sequence =>.

colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f}
p colors
#if the keys are symbols, you can use this alternative notation:
colors = { red: 0xf00, green: 0x0f0, blue: 0x00f}
p colors

arr = [1,2,3]
hash = { arr => 'value'}
p hash[arr]
arr[1] = 99
p hash
p hash[arr]

print <<-match
wagj
 wae ag ewegjaoaeef aj;ef jao
 g 
  faewf ewfi'aewfeaw'few
   waefojewfojweojewrge'ewfaepf fkaewfsdfs dfk
match

#Global variable are available throughout a program $variable.

#Class variables are availble throughout a class or module body.

class Holder
	@@var = 99
	def Holder.var=(val)
		@@var = val
	end
	def var
		@@var
	end
end
@@var = "top level variable"
a = Holder.new
p a.var

Holder.var = 123
p a.var 

#this refrences the top-level object.
def a.get_var
	@@var
end
p a.get_var


class Top
	@@A = 1
	@@B = 2
	def dump 
		puts values
	end
	def values 
		"#{self.class.name}: @@A = #@@A, @@B = #@@B"
	end
end
class MiddleOne < Top
	@@B = 2
	@@C = 2
	def values
		super + ", C = #@@C"
	end
end
class MiddleTwo < Top
	@@B = 3
	@@C = 3
	def values
		super + ", C = #@@C"
	end
end
class BottomOne < MiddleOne; end
class BottomTwo < MiddleTwo; end

Top.new.dump
MiddleOne.new.dump	
MiddleTwo.new.dump
BottomOne.new.dump
BottomTwo.new.dump

p 23 && 32


























