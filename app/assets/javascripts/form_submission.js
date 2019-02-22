// Gets the response and deals with it accordingly
function handleResponse (response) {
  var url = current_user.url_new();

  $.ajax({
    url: url,
    dataType: 'script',
    success: function () {
      (response.success) ? handleSuccess(response) : handleError(response);
    }
  });
}

// User did not update
function handleError (response) {
// Gathers submitted information and displays it on the form
  for (var key in response.attribute) {
    var input_field = `user[${current_user.current_attr}_attributes][${key}]`;
    var value = response.attribute[`${key}`];

    $(`input[name="${input_field}"]`).val(value);
  }
// Displays errors and reattaches listener
  $('section').prepend(`<ul class="errors"><p>${response.messages.length} errors<br>Prohibited from being saved:</p></ul>`);

  for (var index in response.messages) {
    $('.errors').append(`<li>${response.messages[index]}</li>`);
  }
  
  addFormListener();
}

// User updated displays updated list
function handleSuccess (response) {
  $('section').html('');

  item = new Item(response.attribute);
// check for type of action
  (response.action === "new") ? item.appendTitle() : item.replaceTitle();

  addItemListener(item);
  addNewAction();
}
