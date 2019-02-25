function Quest (attributes) {
  this.id = attributes.id;
  this.title = attributes.title;
  this.description = attributes.description;
  this.createdAt = attributes.createdAt;
  this.updatedAt = attributes.updatedAt;
  this.objective_id =  attributes.objective_id;
}

Quest.prototype.objective = function () {
  return this.objective_id === 1 ? "short" : "long";
}

Quest.prototype.count = function () {
  var diff = Math.abs(new Date() - new Date(this.updatedAt)) /1000/60/60/24;

  return Math.floor(diff);
}

Quest.prototype.message = function () {
  var c = this.count();

  if (this.objective_id === 2) {

    switch(true) {

    case c <= 7:
      return "Take you're time";
    case c > 7 && c <= 14:
      return "You got this!!";
    case c > 15 && c <= 21:
      return "Eye on the prize!!";
    case c > 21:
      return "Time's up, please update your quest";
    }
  } else if (this.objective_id === 1) {

    switch(true)

    return "Take you're time, you're in it for the long haul";
  }
}
