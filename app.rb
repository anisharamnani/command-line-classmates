require './lib/*'

# make a new scraper 
# get the students names from the scraper 
# get the blogs get the twitter 
# make a new student object for each person 

# app combines the twitter 

student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
names = student_scraper.get_names
twitters = student_scraper.get_twitters
blogs = student_scraper.get_blogs 

students = []
28.times do |i|
	students << Student.new(names[i], twitters[i], blogs[i],) 
end

puts students