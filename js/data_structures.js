var colors=["brown","grey","pink","turquoise"];
var names=["Secretariat", "SeattleSlew", "ManOWar", "Seabiscuit"];

colors.push("blue");
names.push("WarAdmiral");

console.log(colors);
console.log(names);

// create new object horseColor
// if colors.length = names.length
  // loop through elements of array
    // add property (color) and value (name) to horseColors
  // end loop

var horseColor = {};
if(colors.length == names.length) {
  for(var i=0; i<names.length; i++) {
    horseColor[names[i]] = colors[i];
  }
}
console.log(horseColor.ManOWar);