var current_user;

function User(name, current_attr) {
  this.id = $('.my-life-links').attr("data-id");
  this.name = name;
  this.current_attr = current_attr;
}

User.prototype.url_new = function () {
    return `/users/${this.id}/${this.current_attr}/new`;
}

User.prototype.url_edit = function () {
  return `/users/${current_user.id}/${current_user.current_attr}/${current_user.current_item.id}/edit`;
}
