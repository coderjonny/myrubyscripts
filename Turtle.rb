class Turtle
	#directions: 0 = E, 1 = S, 2 = W, 3 = N
	#axis: 0 =X, 1 = y
	def initialize
		@board = Hash.new(" ")
		@x = @y = 0
		@direction = 0
		pen_up
	end
	def pen_up
		@pen_down = false
	end
	def pen_down
		@pen_down = true
		mark_current_location
	end
	def forward(n=1)
		n.times {move}
	end
	def left
		@direction -= 1 
		@direction = 3 if @direction < 0
	end
	def right
		@direction += 1
		@direciton = 0 if @direction > 3
	end
	def walk(&block)
		instance_eval(&block)
	end
	def draw
		min_x, max_x = @board.keys.map{|x,y| x}.minmax
		min_y, max_y = @board.keys.map{|x,y| y}.minmax
		min_y.upto(max_y) do |y|
			min_x.upto(max_x) do |x|
				print @board[[x,y]]
			end
			puts
		end
	end
	private 
	def move
		increment = @direction > 1 ? -1 : 1
		if @direction.even?
			@x += increment
			else
			@y += increment
		end
		mark_current_location
	endnew
	def mark_current_location
		@board[[@x,@y]] = "#" if @pen_down
	end
end
turtle = Turtle.new
turtle.walk do 
	3.times do
		forward(8)
		pen_down
		4.times do
			forward(4)
			left
		end
		pen_up
	end
end
turtle.draw