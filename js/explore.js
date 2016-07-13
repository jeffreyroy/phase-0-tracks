/* Pseudocode

function reverse(aString)
	Initialize empty string for result
	Loop through each letter of aString
		Add current letter to beginning of result
	End of loop
	Return result
End of function

*/

function reverse(aString) {
	var result = "";
	for(i = 0; i < aString.length; i++) {
		result = aString[i] + result;
	}
	return result;
}

//  Driver code
elloh = reverse("Hello")
if(1 == 1 || 1 > 2) {
	console.log(elloh);
}
