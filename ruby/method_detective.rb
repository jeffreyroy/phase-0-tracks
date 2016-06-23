# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# WARNING--
# The notorious criminals ".replace" and ".sub" could have committed almost
# every crime in this list!  Recommend immediate apprehension.
# Here is an example of their versatility:

puts "same".replace("different")
puts "same".sub("same", "different")
puts "same".gsub("same", "different")

# I'll omit these shapeshifters from the rest of my analysis.

puts "iNvEsTiGaTiOn".swapcase

# => “InVeStIgAtIoN”

puts "zom".insert(1, "o")
# => “zoom”

p "enhance".center(15)
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

puts "the usual".concat(" suspects")
puts "the usual".insert(9, " suspects")
#=> "the usual suspects"

puts " suspects".prepend("the usual")
puts " suspects".insert(0, "the usual")
# => "the usual suspects"

puts "The case of the disappearing last letter".chop
puts "The case of the disappearing last letter".chomp("r")
puts "The case of the disappearing last letter".slice(0, 39)
puts "The case of the disappearing last letter".slice(0..38)
puts "The case of the disappearing last letter".slice("The case of the disappearing last lette")
puts "The case of the disappearing last letter".byteslice(0, 39)
puts "The case of the disappearing last letter".byteslice(0..38)
# => "The case of the disappearing last lette"

puts "The mystery of the missing first letter".delete("T")
puts "The mystery of the missing first letter".slice(1, 40)
puts "The mystery of the missing first letter".slice(1..39)
puts "The mystery of the missing first letter".slice("he mystery of the missing first letter")
puts "The mystery of the missing first letter".byteslice(1, 40)
puts "The mystery of the missing first letter".byteslice(1..39)
puts "The mystery of the missing first letter".sub("T", "")
puts "The mystery of the missing first letter".gsub("T", "")
# => "he mystery of the missing first letter"

puts "Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"

puts "z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# 122 is the ASCII code for lowercase "z"

puts "How many times does the letter 'a' appear in this string?".count("a")
# => 4