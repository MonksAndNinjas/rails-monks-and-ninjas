// Appends name, title, or source of attr to section
function appendTitle (attr, title, id) {
  $('article').append(`<a href="#" id="${attr}-${id}">${title}</a><br><hr>`);
}

// Appends attr content into ul tag of my_life.html.erb
function appendContent(data) {
  $('form').remove();
  $('section').append(`<ul></ul>`);

  $.each(data, function( index, value ) {
    $('ul').append(`<li>${index}: ${value}</li>`);
  });
}

// Appends new item button
function addNewAction (attr, id) {
// Quests has double nested route so need to check for that and retrieve appropriate form
  if (attr === "quests") {
    $('.actions')
      .append(`<button class="new-action" data-id="${attr}-1">Short ${attr}</button><button class="new-action" data-id="${attr}-2">Long ${attr}</button>`);

    $('.new-action').click(function() {
      getQuestForm(event, id);
    });
  } else {
    $('.actions').append(`<button class="new-action" data-id="${attr}">New ${attr}</button>`);

    $('.new-action').click(function() {
      getForm(event, id);
    });
  }
}

// Appends edit item button
function addEditAction (attr, id, data) {
  $('.edit-action').remove();
  $('.actions').append(`<button class="edit-action" data-id="${attr}-${id}">Edit</button>`);

  $('.edit-action').on("click", function() {
    getEditForm(this, data);
  });
}

// Appends delete item button
function addDeleteAction (attr, id, data) {
  $('.delete-action').remove();
  $('.actions').append(`<button class="delete-action" data-id="${attr}-${id}">Delete</button>`);

  $('.delete-action').on("click", function() {
    var attr_data = $(this).data("id").split("-");
    var attr = attr_data[0];
    var attr_id = attr_data[1];
    var id = $('.attr').first().data("id");
    var url = `/users/${id}/${attr}/${attr_id}`;

    if (attr === "quests") {
      url = `/users/${id}/objectives/${data.objective_id}/quests/${attr_id}`;
    }

    resetFields();

    $.ajax({
      type: "POST",
      url: url,
      dataType: 'json',
      data: {"_method":"delete"},
      complete: function () {
        alert("Successfully Deleted");
        var user_data = $(`.attr[name="${attr}"]`);

        getUserData(user_data);
      }
    });
  });
}
