# Define class Santa
class Santa
	attr_reader :age, :ethnicity
	attr_accessor :gender
	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end
	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end
	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end
	def celebrate_birthday
		@age += 1
	end
	def get_mad_at(reindeer)
		# Check whether reindeer exists
		i = @reindeer_ranking.index(reindeer)
		if i
			# Move it to the end of the list
			@reindeer_ranking.delete_at(i)
			@reindeer_ranking << reindeer
		end
	end
	def favorite_reindeer
		@reindeer_ranking[0]
	end
	# getter and setter methods not needed because of shortcuts above
	# def age
		# @age
	# end
	# def ethnicity
		# @ethnicity
	# end
	# def gender=(new_gender)
		# @gender = new_gender
	# end

end

# Test it out with some specific Santas
kris_kringle = Santa.new("male", "white")
kris_kringle.eat_milk_and_cookies("gingerbread man")
puts kris_kringle.ethnicity

father_christmas = Santa.new("male", "black")

father_christmas.get_mad_at("Dasher")
father_christmas.get_mad_at("Rudolph")
p father_christmas.favorite_reindeer

father_christmas.gender = "female"
p father_christmas.gender

snegurochka = Santa.new("female", "white")
p snegurochka.gender


## Create a horde of random Santas

# Lists of attributes
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
santas = []

# Create 100 santas
while santas.length < 100
	# Choose random attibutes
	gender = example_genders.sample
	ethnicity = example_ethnicities.sample
	age = rand(140)
	# Create new santa
	temp = Santa.new(gender, ethnicity)
	# Update age using birthdays
	if age > 0
		(1..age).each do |i|
			temp.celebrate_birthday
		end
	end
	# Print result and add it to the list
	puts "Created a new #{temp.gender} #{temp.ethnicity} Santa, age #{temp.age}"
	santas << temp
end
