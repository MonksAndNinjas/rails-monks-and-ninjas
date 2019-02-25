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

Quest.prototype.countdown = function () {
  var diff = Math.abs(new Date() - new Date(this.updatedAt)) /1000/60/60/24;

  return Math.floor(diff);
}

Quest.prototype.message = function () {
  if (this.objective_id === 1) {
    if (this.countdown() < 8) {
      return "Take you're time";
    } else if (this.countdown() > 7 && this.countdown() < 15) {
      return "You got this!!";
    } else if (this.countdown() > 14 && this.countdown() < 22) {
      return "Eye on the prize!!";
    } else if (this.countdown() > 21) {
      return "Time's up, it's time to update your quest";
    }
  } else if (this.objective_id === 2) {
    return "Take you're time, you're in it for the long haul"
  }
}
