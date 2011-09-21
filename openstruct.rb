require 'ostruct'

os = OpenStruct.new( "f1" => "one", :f2 => "two")
os.f3  = "cat"
os.f4 = 99
p os.f1 #=> "one"
p os.f2 #=> "two"
p os.f3 
p os.f4

require 'ostruct'
ice = OpenStruct.new
ice.freeze = "yes"
p ice.freeze 

