var correctNumber = () => Math.round(quest.count() / 5.7);
var diff = () => Math.abs(new Date() - new Date(quest.updatedAt)) /1000/60/60/24;
var c = () => (quest.objective_id === 2) ? quest.count() : correctNumber();

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
  return Math.floor(diff());
}

Quest.prototype.message = function () {
  switch(true) {

  case c() <= 7:
    return "Take you're time";
  case c() > 7 && c() <= 14:
    return "You got this!!";
  case c() > 14 && c() <= 21:
    return "Eye on the prize!!";
  case c() > 21:
    return "Time's up, please update your quest";
  }
}

Quest.prototype.editQuest = function () {
  $('.actions').append(`<a href="/users/${$('.container').attr("data-id")}/` +
                       `objectives/${this.objective_id}/quests/${this.id}/edit">Edit Quest</a>`)
}
