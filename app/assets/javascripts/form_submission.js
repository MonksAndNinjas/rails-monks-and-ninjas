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
