require 'prettyprint'
@children = Hash.new {|h,k| h[k] = Array.new}
ObjectSpace.each_object(Class) do |cls|
	@children[cls.superclass] << cls if cls <= Numeric
end
def print_children_of(printer, cls)
	printer.text(cls.name)
	kids = @children[cls].sort_by(&:name)
	unless kids.empty?
		printer.group(0, " [", "]") do
			printer.nest(3) do
				printer.breakable
				kids.each_with_index do |k, i|
					printer.breakable unless i.zero?
					print_children_of(printer, k)
				end
			end
			printer.breakable
		end
	end
end
printer = PrettyPrint.new($stdout, 30)
print_children_of(printer, Object)
printer.flush
