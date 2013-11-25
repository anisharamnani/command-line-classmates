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

	def get_student_names
		# html.search("div.face.front h3").text
		# solution: http://stackoverflow.com/questions/12659606/insert-spaces-into-a-string-using-ruby
		# add in a period to account for keith's name (Jr.)
		 # html.search("div.face.front h3").text.split(/(?<=[a-z.])(?=[A-Z])/)
		 html.search("h3").collect{|h3| h3.text}
	end

	def get_student_blogs
		# alternative way: block.at_xpath("*img")["width"] <--bracket syntax
		# html.search("a.blog").collect {|anchor| anchor['href']}
		# html.search("ul.social").collect {|social_div| if social_div.search("a.blog").text == "Blog"}
		
		html.search(".back").collect do |back_div|
			# originally we had ul.social but we are doing .back instead
			# .back is the class before so that we can take into account those students
			# who don't have any information listed
			if back_div.search(".blog").text == "Blog"
				back_div.search(".blog")[0]["href"]
			else 
				"none"
			end
		end
	end 


	def get_twitter_urls
		# html.search(".twitter").text.split

		html.search(".back").collect do |back_div|
			# strip returns a copy of str with leading and trailing whitespace removed.
			if back_div.search(".twitter").text.strip[0] == "@"
				back_div.search(".twitter").text.strip
			else
				"none"
			end 
		end 
	end 

	# def get_stuff(selector)
	# 	html.search(selector).collect{|element| element.text}
	# end 
end 

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

puts my_scraper.get_student_names

# everything in the DOM is an object. 

# 1. open up the twitter or blog 
# 2. or it's going to give you a random blog 
# 3. going to have to make a list of students
# 4. challenges: give your student class more attributes 
