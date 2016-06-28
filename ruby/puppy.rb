# class Puppy
#
# Characteristics of a puppy:
# 	Name: string
#	Breed: string
#  	Age: integer
#	Color: string
# 	Friendly: boolean
#
# Behavior of a puppy:
# 	Bark
#	Roll over
#  	Fetch
# 	Stand up

# Define new class
class Puppy
	# To be filled in in later exercises
end

p Puppy.methods

# Create instances of Puppy
fido = Puppy.new
duchess = Puppy.new
spot = Puppy.new

# Test out the new class
p spot.class
p duchess == fido
p fido.instance_of?(Array)
p fido.instance_of?(Puppy)
