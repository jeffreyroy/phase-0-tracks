# Puppy class
class Puppy

  def initialize
  	puts "Initializing a new Puppy instance..."
  end
  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end
  def speak(n)
  	puts "Woof! " * n
  end
  def roll_over
  	puts "*rolls over*"
  end
  def dog_years(n)
  	n * 7
  end
  def chase_tail
  	puts "*runs in a circle, chasing his tail*"
  end
end

# Kitten class
class Kitten
  def initialize
  	  puts "Creating a kitten..."
  end
  def meow
  	puts "Meow!"
  end
  def catch(rodent)
  	puts "The kitten caught a #{rodent}!"
  end
end

# Driver code
fido = Puppy.new
fido.fetch("ball")
fido.speak(3)
fido.roll_over
puts "11 human years is #{fido.dog_years(11)} dog years."
fido.chase_tail

felix = Kitten.new
felix.meow
felix.catch("mouse")

# Create 50 kittens
kitten_list=[]
for count in 1..50
	kitten_list << Kitten.new
end

# Loop over 50 kittens
kitten_list.each do |a_kitten|
	a_kitten.meow
	a_kitten.catch("rat")
end