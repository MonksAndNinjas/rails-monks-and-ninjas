// Appends attr content into ul tag of my_life.html.erb
function appendContent () {
  $('form').remove();
  $('section').append(`<ul></ul>`);

  $.each(this, (index, value) => $('ul').append(`<li>${index}: ${value}</li><hr>`));
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
function addEditAction () {
  $('.edit-action').remove();
  $('.actions').append(`<button class="edit-action" data-id="${current_user.current_attr}-${current_user.current_item.id}">Edit</button>`);
// Assign current_objective in case of edit
  if (current_user.current_attr === "quests") current_user.current_objective = this.objective_id;

  addEditListener();
}

// Appends delete item button
function addDeleteAction () {
  $('.delete-action').remove();
  $('.actions').append(`<button class="delete-action">Delete</button>`);

  addDeleteListener();
}
