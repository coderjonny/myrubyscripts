print <<-mis
	Miscellaneous Expressions
	As well as the obvious operator expressions and method calls the (perhaps) less obvious
	statement expressions (such as if and case), Ruby has a few more things that you
	can use in expressions.
	
	Command Expansion
	if you enclose a string in backquotes ( sometimes called backticks) or use the delimited form 
	prefixed by %x, it will (by default) be executed as a command by your underlying operatoing system.
	The value of the expression is the standard output of that command. newlines will not be stipped
	so it is likely that the value you get back will have a trailing return or linefeed character.
	mis
	
p	`date`

p	%x{echo "Hello there"}

#you can use expression expansion and all the usual excape sequences in the command string

#redefining Backquotes 
print <<-red

	Redefinging Backquotes
	in the description of the comman output expression, we said that the string
	in backquotes would "by default" be executed as a command. in fact, 
	the string is passed to the method called KErnel.' (a single backquotes).
	if you want , you can override this. this example uses $?, which 
	contains the status of the last external process run
	red
	
alias old_backquote `
def `(cmd)
result = old_backquote(cmd)
if $? != 0
	puts "*** Command #{cmd} failed: status = #{$?.exitstatus}"
end
result
end

print <<-ass

	Assignment
	just about every example we've given so far in theis book has featured
	assignment. perhaps it's about time we said something about it.
	
	An assignment statement sets the variable or attribute on its left side ( the lvalue)
	to refer the value on the right (the rvalue). it then returns the rvalue as the result of the assignment 
	expression. this means you can chain assignments, and you can perform assignments in 
	some unexpected places:
	ass
	
	a = b = 1 + 2 + 3
	p a
	p b
	a = (b = 1 + 2) + 3
	p a 
	p b
	
# Ruby has two basic forms of assignment. the first assigns an object reference to a variable
# or constant. This form of assignment is hardwired into the language:

instrument = "piano"
MIDDLE_A = 440

print <<-second

	The second form of assignment involves having an object attribute or element reference on 
	the left side. these forms are special, because they are implemented by calling methods
	in the lvalues, which means you can override them.
	
	we've already seen how to define a writable object attribute. simply define a method name 
	ending in an equals sign. this method receives as its parameter the assignments's rvalue.
	we've also seen that you can define [] as a method.
	second
	
class ProjectList
	def inititalize
		@projects = []
	end
	def projects=(list)
		@projects = list.map(&:upcase)
	end
	def [](offset)
		@projects[offset]
	end
end

p list = ProjectList.new
p list.projects = %w{ strip sand prime sand paint sand paint rub paint }
p list[3]
p list[4]
	
	
p list.projects= %w{putting something else here okay}
p list[3]
p list[4]

class Test
	def val=(val)
		@val = val
		return 99
	end
end
 t = Test.new
 a = (t.val = 2)
 p a
 
 print <<-parallel
	
	during your first week in a programming course, you may have had to write
	code to swap the values in two variables:

	
	int a = 1;
	int b = 2;
	int temp;
	
	temp = a;
	a = b;
	b = temp;

	
#in Ruby its sexier.	
	parallel
a=1
b=2
c=3
a, b = b, a
p a
p b

a, b, c = c, b, a
p a
p b
p c

print <<-ruby

	Ruby lets you have a comma-separated list of rvalues( the things on the
	right of the assignment) once ruby sees more than one rvalue in an assignment, the
	rules of parallel assignment come into play. what follows is a descriptions at the logical
	leve; : what happens inside the interpreter is somewhat hairier. users of older versons of Ruby
	should not that these rules have changed in ruby 1.9
	
	first all the rvalues are evaluated, left to right, and collected into an array (unless they
	are already an array). this array will be the eventual value returned by the overall assignment
	
	next, the left side (lhs) is inspected. if it contains a single element, the array is assigned to that element
	a = 1 , 2, 3, 4
	b = [1, 2, 3, 4]
	
	if the lhs conatins a comma , Ruby matches values on the rhs against successive elements on the 
	lhs. excess elements are discarded.
	ruby
	a, b = 1, 2, 3, 4
	c, = 1, 2, 3, 4
	
	p a
	p b
	p c
	#they are not arrays because of the commas on the left side of the assignment.
	
print <<-splat

	if Ruby sees any splats on the right side of an assignment(that is, rvalues preceded
	by an asterisk), each will be expanded inline into its constituent values during the
	evaluation of the rvalues and before the assignment to lvalues starts:
	
	splat
	


p	a, *b = 1, 2, 3
p	a, *b = 1

puts "splat soakes up whats left behind"
*a, b, c = 1, 2, 3, 4, 5, 6
puts "a = #{a}"
puts "b = #{b}"
puts "c = #{c}"

#As with method parameters you can use a raw asterisk to ignore some rvalues:

first, *, last = 1,2,3,4,5,6

puts "\nfirst = #{first}, last = #{last}"

print <<-Nested 

	parallel assignments have one more freatur worth mentioning.
	The left side of an assignment may conatain a parenthesized list of terms.
	Ruby treats these terms as if they were a nested assignment statemnet.
	it extracts the corresponding rvalue, assigning it to the parenthesized terms,
	before continuiing with the higher-level assignment.
	Nested
a, (b, *c), d = 1, [2,3,4], 5
p a,b,c,d
	
# a = a + 2 is the same as a +=2

class Bowlerized 
	def initialized(string)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	