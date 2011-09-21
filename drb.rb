require 'drb'
class TestServer
	def add(*args)
		args.inject {|n, v| n+v}
	end
end
server = TestServer.new
Drb.start_service('druby://localhost:9000', server)
Drb.thread.join #don't exit just yet

require 'cgi'
cgi = CGI.new("html4")
#fetch the value of the form field "expression"
exp