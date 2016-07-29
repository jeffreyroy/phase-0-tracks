// toggle bold heading on click
function embolden(event) {
	if(event.target.style.fontWeight == "bold") {
		event.target.style.fontWeight = "normal";
		event.target.style.fontSize = "medium";
	}
	else {
		event.target.style.fontWeight = "bold";
		event.target.style.fontSize = "xx-large";
	}
}

// reveal next list element
function count()  {
	if (count_number <= 2) {
		console.log(count_list[count_number].innerHTML);
		count_list[count_number].hidden = false;
		count_number++;
	}
}

// get array of list elements
var count_list = document.getElementById("countdown").children;

// hide list element
for(var i=0; i<=2; i++) {
	count_list[i].hidden = true;
}

console.log(count_list);
var count_number = 0;

// toggle heading on click
var h = document.getElementById("main-heading");
h.addEventListener("click", embolden);

// reveal one list element per second
window.setInterval(count, 1000);