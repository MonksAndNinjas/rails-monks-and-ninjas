var current_user;

function User(name, current_attr, current_item, current_objective) {
  this.id = $('.my-life-links').attr("data-id");
  this.name = name;
  this.current_attr = current_attr;
  this.current_item = current_item
  this.current_objective = current_objective;

  this.url_new = function () {
    if (current_user.current_attr === "quests") {
      return `/users/${current_user.id}/objectives/${this.current_objective}/${current_user.current_attr}/new`;
    } else {
      return `/users/${this.id}/${this.current_attr}/new`;
    }
  }

  this.url_edit = function () {
    if (current_user.current_attr === "quests") {
      return `/users/${current_user.id}/objectives/${this.current_objective}/quests/${current_user.current_item.id}/edit`;
    } else {
      return `/users/${this.id}/${this.current_attr}/${this.current_item.id}/edit`;
    }
  }

  this.url_delete = function () {
    if (current_user.current_attr === "quests") {
      return `/users/${current_user.id}/objectives/${data.objective_id}/quests/${current_user.current_item.id}`;
    } else {
      return `/users/${current_user.id}/${current_user.current_attr}/${current_user.current_item.id}`;
    }
  }
}
