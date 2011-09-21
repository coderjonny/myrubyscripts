def display(port=$>)
	port.write self
end

1.display
"cat".display
[4, 5, 2].display
puts