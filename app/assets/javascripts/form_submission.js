// Gets the response and deals with it accordingly
function handleResponse (response) {
  var url = `/users/${response.id}/${response.action}/new`;
// Gets the response from the appropriate url; double or single nested attribute
  if (response.action === "quests") {
    var objectiveId = response.user_params.quests_attributes.objective_id;
    url = `/users/${response.id}/objectives/${objectiveId}/quests/new`;
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
  var invalid_data = response.user_params[`${response.action}_attributes`];
// Gathers submitted information and displays it on the form
  for (var key in invalid_attr){
    var attr = `${response.action}_attributes`;
    var input_field = `user[${attr}][${key}]`;
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
  var user_data = $(`.attr[name="${response.action}"]`);

  $('.attr-form').html('');

  getUserData(user_data);
}
