# Define list of candidates

candidate_list = [
	{
		:fn => "Hillary",
		:ln => "Clinton",
		:age => 68,
		:party => "Democrat",
		:formerly => ["First lady", "Senator", "Secretary of State"]
	},
	{
		:fn => "Bernie",
		:ln => "Sanders",
		:age => 74,
		:party => "Democrat",
		:formerly => ["Mayor", "Representative", "Senator"]
	},
	{
		:fn => "Donald",
		:ln => "Trump",
		:age => 70,
		:party => "Republican",
		:formerly => ["Businessman"]
	}

]

# Print list of candidate names and party affiliations
candidate_list.each do |candidate|
	puts "#{candidate[:fn]} #{candidate[:ln]} is a #{candidate[:party]}."
end

# List former positions of Bernie Sanders
puts
puts "The former positions of #{candidate_list[1][:ln]} were as follows:"
candidate_list[1][:formerly].each do |title|
	puts title
end

# Change Donald Trump's last name to "Drumpf"
candidate_list[2][:ln] = "Drumpf"
puts
puts "#{candidate_list[2][:fn]}'s last name is now #{candidate_list[2][:ln]}."
