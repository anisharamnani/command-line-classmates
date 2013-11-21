require '../lib/student'

describe Student, "#intialize" do 
	it "returns the name, twitter, and blog when the paramaters are entered" do 
		expect(Student.new("Ashley", "twitter", "blog").name).to eq("Ashley")
	end 
	it "returns the name, twitter, and blog when the paramaters are entered" do 
		expect(Student.new("Ashley", "twitter", "blog").twitter).to eq("twitter")
	end 
	it "returns the name, twitter, and blog when the paramaters are entered" do 
		expect(Student.new("Ashley", "twitter", "blog").blog).to eq("blog")
	end 
end 

