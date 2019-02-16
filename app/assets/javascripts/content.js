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
      .append(`<button class="new-action" data-id="${current_user.current_attr}-1">Short ${current_user.current_attr}</button><button class="new-action" data-id="${current_user.current_attr}-2">Long ${current_user.current_attr}</button>`);
  } else {
    $('.actions').append(`<button class="new-action" data-id="${current_user.current_attr}">New ${current_user.current_attr}</button>`);
  }

  $('.new-action').click(function() {
    if (current_user.current_attr === "quests") {
      current_user.current_objective = $(event.target).data("id").split("-")[1];
    }

    getNewForm();
  });
}

// Appends edit item button
function addEditAction (data) {
  $('.edit-action').remove();
  $('.actions').append(`<button class="edit-action" data-id="${current_user.current_attr}-${current_user.current_item.id}">Edit</button>`);

  $('.edit-action').on("click", function() {
      if (current_user.current_attr === "quests") {
        current_user.current_objective =  data.objective_id;
      }

    getEditForm();
  });
}

// Appends delete item button
function addDeleteAction (data) {
  $('.delete-action').remove();
  $('.actions').append(`<button class="delete-action">Delete</button>`);

  $('.delete-action').on("click", function() {
    var url = `/users/${current_user.id}/${current_user.current_attr}/${current_user.current_item.id}`;

    if (current_user.current_attr === "quests") {
      url = `/users/${current_user.id}/objectives/${data.objective_id}/quests/${current_user.current_item.id}`;
    }

    resetFields();

    $.ajax({
      type: "POST",
      url: url,
      dataType: 'json',
      data: {"_method":"delete"},
      complete: function () {
        alert("Successfully Deleted");
        var user_data = $(`.attr[name="${current_user.current_attr}"]`);

        getUserData(user_data);
      }
    });
  });
}
