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
	for (i=0; i<l; i++) {
		if (stringArray[i].length > result.length) {
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
	for(var property in obj1) {
		if(property in obj2) {
			console.log("Found a key match: " + property)
			if(obj1[property] == obj2[property]) {
				console.log("Found a value match: " + obj1[property]);
				return true;
			}
		}
	}
	return false;
}

// Driver code
console.log(longest(["long phrase","longest phrase","longer phrase"]));
console.log(longest(["small", "tiny", "supercalifragilisticexpialidocious", "short"]));
console.log(longest([]));

var johnDoe = {
	firstName: "John",
	middleName: "A",
	lastName: "Doe"
};

var richardRoe = {
	firstName: "Richard",
	lastName: "Roe"
};

console.log(johnDoe["firstName"]);
console.log(keyMatch(johnDoe, richardRoe));

