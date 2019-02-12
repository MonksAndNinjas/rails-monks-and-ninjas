function handleResponse (response) {
  var url = `/users/${response.id}/${response.action}/new`;

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

function handleError (response) {
  var invalid_attr = response.user_params[`${response.action}_attributes`];

  for (var key in invalid_attr){
    var attr = `${response.action}_attributes`;
    var search = `user[${attr}][${key}]`;
    var value = invalid_attr[`${key}`];

    $(`input[name="${search}"]`).val(value);
  }

  $('section').prepend(`<ul class="errors"><p>${response.messages.length} errors<br>Prohibited from being saved:</p></ul>`);

  for (let i = 0; i < response.messages.length; i++) {
    $('.errors').append(`<li>${response.messages[i]}</li>`);
  }
  addFormListener();
}

function handleSuccess (response) {
  $('.attr-form').html('');

  var user_data = $(`.attr[name="${response.action}"]`);

  getUserData(user_data);
}