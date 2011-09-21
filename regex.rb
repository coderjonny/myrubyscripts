print <<-regex, <<-ruby
	Page 99 in pickaxe
	String class itself has more than 100 methods
	*you can test a string to see whether it matches a pattern.
	*you can extract from a string the sections that match 
	all or part of a pattern.
	*you can change the string, replacing parts that match a pattern.
	regex

	Ruby's Regular Expressions
	if you want to match one of the special charcters:
	. | ( ) { } [ ] + | ^ $ 
	then precede it with a backslash, 
	so /\*/ is a pattern that matches a single asterisk, 
	and /\// is a pattern that matches a forward slash.
	the ruby operator =~ matches a string against a pattern.
	it returns the character offset into the 
	string at which the match occured.
	ruby
	
p /cat/ =~ "dog and cat"
p /cat/ =~ "catch"
p /cat/ =~ "Cat" 

#or 

p "dog and cat" =~ /cat/

okay = "catch"
str = "cat and dog"
if str and okay =~ /cat/
	puts "there's a cat here somewhere"
end
#you can test to see whether a pattern does not match a string using !~

if str !~ /mouse/
	puts "there aint no mouse."
end

puts "\n\n"
#Changing Strings with Patterns

print <<-subs

	Changing strings with patterns
	.sub method takes a pattern and some replacement text. 
	if it finds a match for the pattern in the string, it replaces
	the matched substring with the replacement text.
	
	To replace all matches, use .gsub method.
	the g stands for global.
	
	if you want to modify the original string, use
	the sub! and gsub! forms
	
	subs
	
string = "Dog and Cat" 
newstring = string.sub(/cat/i, "Gerbil and Hamster")
puts "Let's go to the #{newstring} for a pint."

#using gsub
newstring2 = newstring.sub(/a/, "*")
newstring3 = newstring.gsub(/e/, "*")
newstring3 = newstring3.gsub(/a/, "*")

puts "#{string}"
puts "#{newstring}"
puts "#{newstring2}"
puts "#{newstring3}"
puts "using sub: #{newstring2}"
puts "using gsub: #{newstring3}"

#using gsub! and sub!

str = "now is the time to learn ruby baby!"
puts str
str.sub!(/i/, "really i")
str.gsub!(/o/, "O")
puts str

print <<-diggin

	*Diggin deeper*
	Like most things in Ruby, regular expressions are just objects
	they're instances of class Regexp. This means you can assign
	them to variable, pass them to methods, and so on. 
	
	regular expression objects can be created by calling the Regexp class's
	new method and by using the %r{...} syntax.
	the %r syntax is particularly useful when creating patterns that contain 
	foward slashes.
	
	diggin

str = "dog and cat"
pattern = /nd/
p pattern =~ str

p /mm\/dd/
p Regexp.new("mm/dd")
p %r{mm?dd}

slash = " blah \/ \/ \/\/"
slash2 = slash.gsub(%r{blah /}, "\/\/")
puts "#{slash2}"

print <<-reg
	#regexp objects
	# /i case insensititve.
	# /o subtitute once.
	# /m multiline mode
	reg
apple = "ABdDEFghI WHAT IS going ON?"
newapple = apple.gsub(/a/i, "*")
newapple = newapple.gsub(/o/o, "*")
newapple = newapple.gsub(//m, "*")
newapple3 = newapple.gsub(/./m, "*")
newapple2 = newapple.gsub(/./m, "$")
puts newapple
puts newapple2
puts newapple3

print <<-match
	
	Matching Against Patterns
	Once you have a regualr expression object, you can match it against
	a string using the Regexp#match(string) method or the match operators
	=~ (positive match)
	!= (neg. match)
	
	the match operators return the character position.
	the .match method retruns a matchdata object.
	
	match
	
name = "fats waller"
name2 ="bass expression"
p	name =~ /w/
p	name =~ /z/
p	/a/ =~ name
p 	/a/.match(name)
p	Regexp.new("all").match(name)
p	%r{s w}.match(name)
p	%r{s ex}.match(name2)

print <<-match

	MatchData
	Most Rubyists use the MatchData object from the match method,
	because it encapsulates all the info Ruby knows about the match.
	Given a MatchData object, you can call
	pre_match to return the part of the string before the match
	post_match for the string after the match
	index using [0] to get the matched portion.
	
	match
	
def show_regexp(string, pattern)
	match = pattern.match(string)
	if match
		"#{match.pre_match}-->#{match[0]}<--#{match.post_match}"
	else
		"no match"
	end
end

p show_regexp('very interesting', /t/)
p show_regexp('boulder ready', %r{r})
p show_regexp('Fats Waller', /lle/)
p show_regexp('Fats Waller', /z/)

print <<-match

	Deeper Patterns
	While within a pattern, all charcters match themselves except 
	. | ( ) [ ] { } + \ ^ $ * ?
	Rember to esxcape any of these characters with a backslash if 
	you want them to be treated as a regular charcters to match.
	match
	
p show_regexp('yes | no', /\|/)
p show_regexp('yes (n0)', /\(n0\)/)
p show_regexp('are you sure?', /\?/)


#You can create the intersection of character classes using &&.
#so, to match all lowercase ASCII letters that aren't vowels, you can use:
str = "now is the time"
p  str.gsub(/[a-z&&[^aeiou]]/, '*')

print <<-construct
	
	the \p construct is new with ruby 1.9 it gives you
	an encoding-aware way of matching a character with a 
	particular unicode property
	construct
	
	#encoding:utf-8
string = "dy/dx = 2*3.14*x"
p show_regexp(string, /\p{Alnum}/)
p show_regexp(string, /\p{Digit}/)
p show_regexp(string, /\p{Space}/)
p show_regexp(string, /\p{Graph}/)

print <<-period
	a period (.) appearing outside brackets represents any character
	except a newline (though in multiline lode it matches a newline, too)
	period
	
	a = 'It costs $12.'
p	show_regexp(a, /c.s/)
p	show_regexp(a, /./)
p	show_regexp(a, /\./)

print <<-rep

	Repitition
	The pattern that split the song list line, /\s*\|\s*/ wants us to match
	a vertical bar surrounded by an arbitrary amount of whitespace. we now
	know that the \s sequences match a single whitespace character and 
	\| means a literal vertical bar so
	* means an "arbitrary amount."
	In fact, the asterisk is one of a number of modifiers that allow you 
	to match multiple occurences of a pattern.
r*		Matches zero or one occurences of r.
r+		matches one or more occureces of r.
r?		matches zero or one occurences of r.
r{m,n} 		matches at least m and at most n occurences of r.
r{m,}		matches at least m occurrences of r.
r{,n}		matches at most n occurences of r.
r{m}		matches exactly m occurences of r.
	
	these repetition constructs have a high precedence-theybnid only to the 
	immediately preceding matching construct in the pattern.
	These patterns are called greedy, because by default they will match as much of the 
	string as they can. you can alter this behavior, and have them match the min by adding 
	a question mark suffix. the reppitition id then called lazy-it stops once it has done the 
	min amount of work required.
	rep
	
	a= "the moon is made of cheese, does that make sense?"
p show_regexp(a, /\w+/)
p show_regexp(a, /\s.*\s/)
p show_regexp(a, /\s.*?\s/)
p show_regexp(a, /[aeiou]{2,99}/)
p show_regexp(a, /mo*/)
p show_regexp(a, /mo?o/)
#lazy version
p show_regexp(a, /mo??o/)
#/z* will always match because every sting conatins zero or more z's.
p show_regexp(a, /z*/)

print <<-alt
	
	Alternation
	The vertical bar is special because our line-splitting pattern had to escape it
	with a backslash. that's because an 
	unescaped vertical bar | matches either the
	construct that preceds it or the construct that follows it.
	alt
	
	a = "red ball blue sky"
p show_regexp(a, /d|e/)
p show_regexp(a, /sky|lu/)
p show_regexp(a, /red ball|angry sky/)

print <<-group
	you can use 
	(parentheses) to group terms wthin a regexp.
	everything within the group is treated as a single regular expression.
	group
	
#matches an 'a' followed by one or more 'n's
p show_regexp('banana', /an+/)
# this matches the sequence 'an' one or more times
p show_regexp('banana', /(an)+/)

a= 'red ball blue skly'
p show_regexp(a, /(blue|red) \w+/)

print <<-par

	Parantheses also collect the result of pattern matching
	Ruby counts opening parentheses and for each stores the result of the partial
	match between it and the corresponging closing parenthesis.
	you can use this partial match both within the rest of the pattern and in your
	Ruby program.
	Within the pattern, the sequence 
	\1 refers to the match of the first group,
	\2 the second group and so on.
	outside the pattern, the special variables 
	$1 $2 and so on serve the same purpose.
	par
	
puts	/(\d\d):(\d\d)(..)/ =~ "12:50am"
p	"Hour is #$1, minute #$2"
/((\d\d):(\d\d))(..)/ =~ "12:50am"
p "Timke is #$1"
p "Hour is #$2, minute #$3"
p "AM/PM is #$4"

#if your using the MathData object returned by the match method, you can 
#index into it to get the corresponding subpatterns:
puts "\nMatchData object returned\n"
md = /(\d\d):(\d\d)(..)/.match("12:50am")
puts "\nHour is #{md[1]}, minute #{md[2]}"
md = /((\d\d):(\d\d))(..)/.match("12:50am")
puts "\nTime is #{md[0]}"
puts "Time is #{md[1]}"
puts "hour is #{md[2]}, minute #{md[3]}"
puts "AM/PM is #{md[4]}"

print <<-later
	
	the ability to use part of the current match later in that match allows
	you to look for various forms of repetition:
	later
	#match duplicated letter
p	show_regexp('He said "hello" ', /(\w)\1/)
	#match duplicated substrings
p	show_regexp('mississippi', /(\w+)\1/)

print <<-num
	
	?<char>
	Rather than use numbers, you can also use names to refer to 
	previously matched content. you give a gourp a name by placing 
	?<name> immediately after the opening parenthesis.
	you can subsequently refer to this named group using 
	\k<name>(ior \k'name').
	num
	
	#match duplicated later
	str = ' He said "hello" '
p	show_regexp(str, /(?<char>\w)\k<char>/)
	#match duplicated adjacent substrings
	str = 'mississippi'
p	show_regexp(str, /(?<seq>\w+)\k<seq>/)
	#named matches in a regular expression are also available as local variables
puts /(?<hour>\d\d):(?<min>\d\d)(..)/ =~ "12:50am"
puts "hour is #{hour}, minute is #{min}"

#backslash page 112
#you can also reference named groups
puts "fred:smith".sub(/(?<first>\w+):(?<last>\w+)/, '\k<last>, \k<first>')
puts "nercyitno".gsub(/(?<c1>.)(?<c2>.)/, 'k\<c2>\k<c1>')
puts "nercpyitno".gsub(/(.)(.)/, '\2\1')

str = 'a\b\c'
p str.gsub(/\\/, '\\\\')
p str.gsub(/\\/, '\&\&')

print <<-adv
	
	Advanced Regular Expressions
	knowing some of the real power in the ruby regular exxpression implementation might 
	dig you out of a holeeeeeeeeeeeee.
	Ruby uses the Oniguruma regular expressoni library which offers a large number of extensions
	over traditional Unix regular expressions.
	most of these extensions are written between the characters (? and).
	the aprentheses that bracket these extensions are groups.
	but they do not necessarily generate backreferences. some do not set the value of \1 
	and $1 and so on.
	The sequence (?# comment) insterts a comment into the pattern.
	(?:re) makes re into a group without genereating backreferences. this i9s often useful when
	you need to group a set of constructs but don't want the group to set the value of  $1 
	or whaterver. in the example that follows, both patterns match a date with either colons or
	slashes between the month, day, and year.
	The first form stores the separator charcter(which can be slash or a colon) in $2 and $4.
	but the second pattern doesn't store the separator in an external variable.
	adv
	
date = "3/28/2008"
	
p date =~ %r{(\d+)(/|:)(\d+)(/|:)(|d+)}
p [$1,$2,$3,$4,$5]

date = %r{(\d+)(?:/|:)(\d+)(?:/|:)(\d+)}
p [$1,$2,$3]

print <<-look

	Lookahead and Lookbehind
	you'll sometimes want to match a pattern only if the matched subsubstring is preceded by
	or followed by some other pattern. that is, you want to set some context foy your match but 
	don't want to capture that context as part of the match.
	
	for example, you might want to match every word ina string that is follwed by a comma,
	but you don't want the comma to form part of the match. Here you could use the charming;y
	named zero-width positive lookahead extension:
	(?=re) matches re at this point but does not consume it- you an look forward for the context of a 
	match withous affecting $&. in this example, we'll use scan to pick out the words:
	look
	
str = "red, white, and blue"
p str.scan(/[a-z]+(?=,)/)

print <<-also
		
	you can also match beforethe pattern using (?<=re)(zero-width positive lookbehind).
	this lets you look for characters that preced the context of a match without affecting $&.
	the following exampl matches the letters dog but only if they are preceded by the letters hot.
	you can also match before the pattern using
	(?<=re)(zero-width positive lookbehind)
	this lets you look for characters that precede the context of a match without affecting $&
	for the lookbeind extension, re either must be fixed length or consist of a set of fixed
	length alternatives. that is, (?<=AA) and (?<=aa|bbb) are valid, but (?<=a+b) is not
	
	both forms have negated versions, (?!re) and (?<!re), which are true if
	the contest is not present in then target string.
	also
	
p	show_regexp("seadog hotdog", /(?<=hot)dog/)
p 	str.scan(/(?!)/)

print <<-control

	Controlling Backtracking
	say you're given the proble of searching a string for a sequence of Xs not followed by an O.
	you know that a string of Xs can be represented as (X+)< and you can use a lookahead to check
	that it isn't followed by an O, so you code up the pattern /(X+)(?!P)/
	control
	
re = /(X+)(?!O)/
#works once
p re =~ "test XXXY"
p $1

p re =~"test XXXO"
p $1

print <<-control

	The sequence (?>re) nests an independent regular expression within the first regular epression
	this expression is anchored at the current match position
	if it consumes charactersm these will no longer be available to the higher-level 
	regular expression.
	this construct therefore inhibits backtracking.
	control
	#lets try this
re = /((?>X+))(?!O)/

#this works once
p re =~ "test XXXY"
p $1

#doesn't match
p re =~ "test XXXO"
p $1

#and this finds the second string of X's
p re =~ "test XXXO XXXXY"
p $1

# greedy repetition re+
# laze repetition re+?
#the third form is called posessive.

p re = /(X++)(?!0)/
p re =~ "test XXXY"
p $1

p re=~ "test XXXO"
p $1

p re =~ "test XXXO XXXXY"
p $1

print <<-back

	within a pattern, the sequences \n, \k'n', and \k<n> all refer to the nth captured subpattern.
	thus, the expression /(...)\1/ matches six characters with the first three characters being 
	the same as the last three.
	
	rather than refer to the matches by their number, you can give them names
	and then refer to those names, A subpattern is named using 
	either of the syntaxes (?<name>...)
	or (?'name'...)
	you then refer to these named captures using either \k<name> or \k'name'.
	for example, the follwing shows different ways of matching a time range 
	(in the form hh:mm-hh:mm) where the hour part is the same.
	back
	
	same = "12:15-12:45"
	differ = "12:45-13:15"
	
	#use numbered backreference
p	same =~ /(\d\d):\d\d-1:\d\d/
p	differ =~ /(\d\d):\d\d-\1:\d\d/
	
	#use named backreference
p	same =~ /(?<hour>\d\d):\d\d-\k<hour>:\d\d/
p	differ =~ /(?<hour>\d\d):\d\d-\k<hour>:\d\d/

	#negative backreference numbers refer count backward from the place they're used
	#so they are relative, not absolute numbers. The following pattern matches four-letter palindroms
	
p 	"abab" =~ /(.)(.)\k<-1>\k<-2>/
p 	"adda" =~ /(.)(.)\k<-1>\k<-2>/

print <<-nest

	Nested Groups..
	Named Subroutines..
	nest
	
	
	
	
	









