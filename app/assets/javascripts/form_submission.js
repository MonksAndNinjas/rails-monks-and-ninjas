// Gets the response and deals with it accordingly
function handleResponse (response) {
//  `/users/${current_user.id}/${current_user.current_attr}/new`
  var url = current_user.url_new();
// Gets the response from the appropriate url; double or single nested attribute
  if (current_user.current_attr === "quests") {
    var objectiveId = response.user_params.quests_attributes.objective_id;
    url = `/users/${current_user.id}/objectives/${objectiveId}/quests/new`;
  }

  $.ajax({
    url: url,
    dataType: 'script',
    success: function () {
      if (response.success) {
        handleSuccess(response);
      } else if (!response.success) {
        handleError(response);
      }
    }
  });
}

// User did not update
function handleError (response) {
  var invalid_data = response.user_params[`${current_user.current_attr}_attributes`];
// Gathers submitted information and displays it on the form
  for (var key in invalid_data){
    var input_field = `user[${current_user.current_attr}_attributes][${key}]`;
    var value = invalid_data[`${key}`];

    $(`input[name="${input_field}"]`).val(value);
  }
// Displays errors and reattaches listener
  $('section').prepend(`<ul class="errors"><p>${response.messages.length} errors<br>Prohibited from being saved:</p></ul>`);

  for (let i = 0; i < response.messages.length; i++) {
    $('.errors').append(`<li>${response.messages[i]}</li>`);
  }
  addFormListener();
}

// User updated displays updated list
function handleSuccess (response) {
  var user_data = $(`.attr[name="${current_user.current_attr}"]`);

  $('section').html('');

  getUserData(user_data);
}
