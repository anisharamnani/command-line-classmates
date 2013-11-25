require './lib/student'
require './lib/scraper'
require 'launchy'

# make a new scraper 
# get the students names from the scraper 
# get the blogs get the twitter 
# make a new student object for each person 

# app combines the twitter 

# WARNING: my code is very similar to sarahahahs. i did look at it 
# but I wrote everything myself. 

# second warning: there's a bug where after you choose 
# you want to see a specific twitter or blog and then enter a
# person's name who isn't a student it exits the program. 

class App 

	#Reason for class: need to initialize names, blogs, twitters 
	# as instance variables otherwise the code gets upset. 

	attr_reader :names, :blogs, :twitters

	def initialize 
		student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
		@names = student_scraper.get_student_names
		@twitters = student_scraper.get_twitter_urls
		@blogs = student_scraper.get_student_blogs
	end  

	def all_the_students 
		students = []
		28.times do |i|
			students << Student.new(names[i], twitters[i], blogs[i]) 
		end
		students
	end

	def student_info student
		puts "Name: #{student.name}"
		puts "   Blog: #{student.blog}"
		puts "   Twitter: #{student.twitter}"
	end 

	def student_blog student
		all_the_students.each do |each_student|
			if each_student.name.upcase.start_with?(student)
				Launchy.open("#{each_student.blog}")
			# elsif
			# 	puts "Let's try this again. Whose blog?"
			# 	student = gets.chomp.upcase
			# 	student_blog(student)
			end
		end
	end 

	def student_twitter student
		all_the_students.each do |each_student|
			if each_student.name.upcase.start_with?(student)
				Launchy.open("www.twitter.com/#{each_student.twitter[1..-1]}")
			end
		end
	end 

	def student_selector

		puts "What would you like to see? (Choose a number)"
		puts "1. Random Blog"
		puts "2. Random Twitter"
		puts "3. Specific Blog"
		puts "4. Specific Twitter"

		answer = gets.chomp.to_i

		if answer == 1 
			Launchy.open("#{blogs.sample}")
		elsif answer == 2
			Launchy.open("twitter.com/#{twitters.sample[1..-1]}")

		elsif answer == 3
			puts "Whose Blog?"
			chosen_blog = gets.chomp.upcase
			student_blog(chosen_blog)

		elsif answer == 4
			puts "Whose Twitter?"
			chosen_twitter = gets.chomp.upcase
			student_twitter(chosen_twitter)
		else 
			puts "I'm sorry. Let's try this again."
			student_selector()
		end 

	end
end 

test = App.new 

test.student_selector
