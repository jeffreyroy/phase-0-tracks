# Methods

def encrypt(string)
	index = 0
	while index < string.length
		s = string[index]
		if s == "z"
			string[index] = "a"
		elsif s != " "
			string[index] = string[index].next
		end
		index += 1
	end
	return string
end

def decrypt(string)
	index = 0
	while index < string.length
		alpha_reverse = "zyxwvutsrqponmlkjihgfedcba"
		s = string[index]
		s_location = alpha_reverse.index(s)
		if s_location != nil
			t = alpha_reverse[s_location + 1]
			if s == "a"
			string[index] = "z"
			elsif s != " "
			string[index] = t
			end
		end
		index += 1
	end
	return string
end


#puts decrypt(encrypt("swordfish"))

# Driver Code

print "Would you like to encrypt or decrypt a password? "
choice = gets.chomp

print "Enter password: "
password = gets.chomp

if choice == "encrypt"
	puts "The encryption is: " + encrypt(password)
elsif choice == "decrypt"
	puts "The decryption is: " + decrypt(password)
else
	puts "I didn't recognize your choice"
end