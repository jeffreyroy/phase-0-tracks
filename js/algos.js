/*  Find the longest phrase
pseudocode

function longest(stringArray)
	if stringArray is empty
		return null
	set result to an empty string
	loop through elements of stringArray
		if length of current element > length of result
		set result equal to current element
	end of loop
	return result
end of function

*/

function longest(stringArray) {
	var l = stringArray.length;
	// Check to see whether array is empty, if so return null
	if(l == 0) {
		return null;
	} 
	// Loop through array, checking to see if current element is longest so far
	var result = "";
	for (var i=0; i<l; i++) {
		if (stringArray[i].length > result.length) {
			// If longest, change result to current element
			result = stringArray[i];
		}
	}
	return result;
}

/* Find a key-value match
pseudocode

function keyMatch(obj1, obj2)
	loop through properties of obj1
		if current property is present in obj2
			if current property has same value in obj1 and obj2
				return  true
			end if
		end if
	end of loop
	return false
end of function
*/

function keyMatch(obj1, obj2) {
	// The keys() method seems like it should work, but it doesn't for some reason
	// So we'll use the in operator instead
	// Loop through keys in both objects to see if we find a key match
	for(var property in obj1) {
		if(property in obj2) {
			// If keys match, check for value match
			if(obj1[property] == obj2[property]) {
				return true;
			}
		}
	}
	// If no match, return false
	return false;
}

/* Generate random list of words
pseudocode

function wordArray(n)
	initialize empty array
	loop n times
		initialize empty string
		select random number l between 1 and 10
		loop l times
			select random number between 1 and 26
			find corresponding letter of alphabet
			add that letter to string
		end of loop
		add string to array
	end loop
	return array
end of function
*/

// randomInt(n) returns a random integer between 1 and n
function randomInt(n) {
	return Math.floor(Math.random() * n) + 1;
}

// randomWord generates a gibberish "word" of 1-10 random letters
function randomWord() {
	var alphabet = "abcdefghijklmnopqrstuvwxyz";
	var l = randomInt(10);
	var word = "";
	for(var i=1; i<=l; i++) {
		word = word + alphabet.charAt(randomInt(26) - 1);
	}
	return word;
}

// wordArrary(n) returns array of n random words
function wordArray(n) {
	var array = [];
	for(var i=1; i<=n; i++) {
		array.push(randomWord());
	}
	return array;
}

// Driver code

// Test longest word
console.log(longest(["long phrase","longest phrase","longer phrase"]));
console.log(longest(["small", "tiny", "supercalifragilisticexpialidocious", "short"]));
console.log(longest([]));

// Test key-value match
var johnDoe = {
	firstName: "John",
	middleName: "A",
	lastName: "Doe",
	age: 54
};

var richardRoe = {
	firstName: "Richard",
	lastName: "Roe",
	age: 54
};

console.log(keyMatch(johnDoe, richardRoe));

johnDoe.age = 55;
console.log(keyMatch(johnDoe, richardRoe));

// Test random words
var testArray
for(var i=1; i<=10; i++) {
	testArray = wordArray(3);
	console.log("The longest of " + testArray + " is " + longest(testArray) + ".");
}
