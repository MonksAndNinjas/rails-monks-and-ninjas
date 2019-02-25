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

Quest.prototype.currentDate = function () {
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth() + 1; //January is 0!
  var yyyy = today.getFullYear();

  if (dd < 10) dd = '0' + dd;
  if (mm < 10) mm = '0' + mm;

  today = mm + '/' + dd + '/' + yyyy;
  return today;
}
