# Detect vampire
# Returns integer relecting vampirosity
# 1 = not a vampire, 5 = definitely a vampire
# Returns 0 if unable to tell

# methods

def check_age(age, year)
	diff = 2016 - year - age
	if diff == 1 or diff == 0
		return true
	else
		return false
	end
end

# Get number of employees
employees = 0
puts
puts "Welcome to Werewolf, Inc."
while employees == 0
	puts
	print "How many employees will be processed? "
	employees = gets.chomp.to_i
end


# Main loop
for a in 1..employees

# initialize variables
name = ""
age = 0
birth_year = 0
garlic = ""
insurance = ""
allergies = ""

# questionnaire
puts
puts "Thank you for applying to Werewolf, Inc."
while name == ""
	puts
	print "What is your name? "
	name = gets.chomp.downcase
end

while age == 0
	puts
	print "How old are you? "
	age = gets.chomp.to_i
end

while birth_year == 0
	puts
	print "What year were you born? "
	birth_year = gets.chomp.to_i
end

while garlic != "y" and garlic != "n"
	puts
	puts "Our company cafeteria serves garlic bread."
	print "Should we order some for you? (y/n)"
	garlic = gets.chomp.downcase
end

while insurance != "y" and insurance != "n"
	puts
	print "Would you like to enroll in the company’s health insurance? (y/n)"
	insurance = gets.chomp.downcase
end

puts
puts "Please list any allergies you have.  Enter \"done\" when done."
while allergies != "done" && allergies != "sunshine"
	print "Enter an allergy: "
	allergies = gets.chomp.downcase
end

# vampire check
vampirosity = 0
vampire_names = ["dracula", "lestat", "nosferatu", "drake cula", "tu fang"]
results = ["Results inconclusive", "Not a vampire", "Probably not a vampire", 
	"Probably a vampire", "Almost certainly a vampire", "Definitely a vampire"]
age_right = check_age(age, birth_year)
likes_garlic = (garlic == "y")
wants_insurance = (insurance == "y")

if age_right && likes_garlic && wants_insurance
	vampirosity = 2
end

if !age_right && ( !likes_garlic || !wants_insurance )
	vampirosity = 3
end

if !age_right && !likes_garlic && !wants_insurance
	vampirosity = 4
end

if vampire_names.index( name )
	vampirosity = 5
end

if allergies == "sunshine"
	vampirosity = 5
end

# Print result
print "Result: "
puts results[vampirosity]

# End of main loop
end

puts
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

