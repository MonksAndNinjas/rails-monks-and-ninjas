var current_user;

function User(name, current_attr, current_item, current_objective) {
  this.id = $('.my-life-links').attr("data-id");
  this.name = name;
  this.current_attr = current_attr;
  this.current_item = current_item
  this.current_objective = current_objective;
}

User.prototype.url_new = function () {
  if (current_user.current_attr === "quests") {
    return `/users/${current_user.id}/objectives/${this.current_objective}/${current_user.current_attr}/new`;
  } else {
    return `/users/${this.id}/${this.current_attr}/new`;
  }
}

User.prototype.url_edit = function () {
  if (current_user.current_attr === "quests") {
    return `/users/${current_user.id}/objectives/${this.current_objective}/quests/${current_user.current_item.id}/edit`;
  } else {
    return `/users/${this.id}/${this.current_attr}/${this.current_item.id}/edit`;
  }
}
