# Puppy class
class Puppy

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

# Driver code
fido = Puppy.new

fido.fetch("ball")
fido.speak(3)
fido.roll_over
puts "11 human years is #{fido.dog_years(11)} dog years."
fido.chase_tail
