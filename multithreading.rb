print <<-multi

Multithreading
Ruby uses native operating system threads but operates only a single 
thread at a time. you'll never see two threads in the same app running 
ruby code truly concurrently. you will, however, see threads busy 
doing (say) IO while another thread executes Ruby code)
multi

# CREATING RUBY THREADS
require 'net/http'
pages = %w( www.rubycentral.com slashdot.org www.google.com)
threads = []
for page_to_fetch in pages
	threads << Thread.new(page_to_fetch) do |url|
		h = Net::HTTP.new(url, 80)
		print "Fetching: #{url}\n"
		resp = h.get('/')
		print "Got #{url}: #{resp.message}\n"
	end
end
threads.each {|thr| thr.join}
