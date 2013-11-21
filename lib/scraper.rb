# Ashley's gist--command line classmates
# https://gist.github.com/ashleygwilliams/7586141
# require the libraries that we need 

require 'open-uri'
require 'nokogiri'

class Scraper
	attr_reader :html

	def initialize(url)
		download = open(url) 
		# into the class Nokogiri 
		# using the method HTML 
		# passing the paramater download 
		# we want to use HTML function to make it into ruby
		# download: originally a temp file 
		@html = Nokogiri::HTML(download)
	end

	def get_students_names
		# html.search("div.face.front h3").text
		# solution: http://stackoverflow.com/questions/12659606/insert-spaces-into-a-string-using-ruby
		# add in a period to account for keith's name (Jr.)
		html.search("div.face.front h3").text.split(/(?<=[a-z.])(?=[A-Z])/)
	end

	def get_student_blogs
		html.css(".blog").map {|link| link['href']}
	end 

	def get_twitter_urls
		html.css(".twitter").text.split
	end 
end 

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

puts my_scraper.get_student_blogs