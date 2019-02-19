// Appends name, title, or source of attr to section
function appendTitle (title, id) {
  $('article').append(`<a href="#" id="${current_user.current_attr}-${id}">${title}</a><br><hr>`);
}

// Appends attr content into ul tag of my_life.html.erb
function appendContent(data) {
  $('form').remove();
  $('section').append(`<ul></ul>`);

  $.each(data, function( index, value ) {
    $('ul').append(`<li>${index}: ${value}</li><hr>`);
  });
}

// Appends new item button
function addNewAction () {
// Quests has double nested route so need to check for that and retrieve appropriate form
  if (current_user.current_attr === "quests") {
    $('.actions')
      .append(`<button class="new-action" data-id="${current_user.current_attr}-1">Short ${current_user.current_attr}</button>` +
      `<button class="new-action" data-id="${current_user.current_attr}-2">Long ${current_user.current_attr}</button>`);
  } else {
    $('.actions').append(`<button class="new-action" data-id="${current_user.current_attr}">New ${current_user.current_attr}</button>`);
  }

  addNewListener();
}

// Appends edit item button
function addEditAction (data) {
  $('.edit-action').remove();
  $('.actions').append(`<button class="edit-action" data-id="${current_user.current_attr}-${current_user.current_item.id}">Edit</button>`);

  addEditListener(data);
}

// Appends delete item button
function addDeleteAction (data) {
  $('.delete-action').remove();
  $('.actions').append(`<button class="delete-action">Delete</button>`);

  addDeleteListener();
}
