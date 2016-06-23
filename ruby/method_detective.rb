# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# WARNING--
# The notorious criminals ".replace" and ".sub" could have committed every
# crime in this list!  Recommend immediate apprehension.
# Here is an example of their versatility:

p "same".replace("different")
p "same".sub("same", "different")
p "same".gsub("same", "different")

# I'll omit these shapeshifters from the rest of my analysis.

p "iNvEsTiGaTiOn".swapcase

# => “InVeStIgAtIoN”

p "zom".insert(1, "o")
# => “zoom”

p "enhance".center(15)
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

p "the usual".concat("suspects")
p "the usual".insert(9, "suspects")

#=> "the usual suspects"

# " suspects".<???>
# => "the usual suspects"

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

# "z".<???>
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

# "How many times does the letter 'a' appear in this string?".<???>
# => 4