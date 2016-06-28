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
		i = @reindeer_ranking.index(reindeer)
		if i
			@reindeer_ranking.delete_at(i)
			@reindeer_ranking << reindeer
		end
		p @reindeer_ranking
	end
	def favorite_reindeer
		@reindeer_ranking[0]
	end
end

# Test it out with some specific Santas
kris_kringle = Santa.new("male", "white")
puts kris_kringle.ethnicity

father_christmas = Santa.new("male", "black")

father_christmas.get_mad_at("Dasher")
father_christmas.get_mad_at("Rudolph")
p father_christmas.favorite_reindeer

father_christmas.gender = "female"
p father_christmas.gender

snegurochka = Santa.new("female", "white")
p snegurochka.gender


# Create a horde of Santas
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
santas = []

while santas.length < 100
	gender = example_genders.sample
	ethnicity = example_ethnicities.sample
	temp = Santa.new(gender, ethnicity)
	puts "Created a new #{temp.gender} #{ethnicity} Santa."
	santas << temp
end
