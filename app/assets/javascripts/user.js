var current_user;
// User serves as storage for dynamic current data that belongs to current_user
function User(name, current_attr, current_item, current_objective) {
  this.id = $('.my-life-links').attr("data-id");
  this.name = name;
  this.current_attr = current_attr;
  this.current_item = current_item;
  this.current_objective = current_objective;
}
// Think about refactoring to a function that an write out url instead of three functions?
User.prototype.url_new = function () {
  if (this.current_attr === "quests") {
    return `/users/${this.id}/objectives/${this.current_objective}/quests/new`;
  } else {
    return `/users/${this.id}/${this.current_attr}/new`;
  }
}

User.prototype.url_edit = function () {
  if (this.current_attr === "quests") {
    return `/users/${this.id}/objectives/${this.current_objective}/quests/${this.current_item.id}/edit`;
  } else {
    return `/users/${this.id}/${this.current_attr}/${this.current_item.id}/edit`;
  }
}

User.prototype.url_delete = function () {
  if (this.current_attr === "quests") {
    return `/users/${this.id}/objectives/${this.objective_id}/quests/${this.current_item.id}`;
  } else {
    return `/users/${this.id}/${this.current_attr}/${this.current_item.id}`;
  }
}
