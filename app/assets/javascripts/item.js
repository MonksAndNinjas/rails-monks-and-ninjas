function Item(attributes) {
  this.id = attributes.id
  this.name = Object.entries(attributes)[1][1];
}

Item.prototype.appendTitle = function () {
  $('article').append(`<a href="#" id="${current_user.current_attr}-${this.id}">${this.name}</a><br><hr>`);
}


Item.prototype.replaceTitle = function () {
  $(`a[id="${current_user.current_attr}-${this.id}"]`).text(`${this.name}`);
}
