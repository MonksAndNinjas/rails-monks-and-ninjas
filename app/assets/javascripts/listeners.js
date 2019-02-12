// Add Event Listeners to name, source, or title or attr
function addListener (attr, item) {
  document.getElementById(`${attr}-${item.id}`).addEventListener("click", function() {
    $.getJSON(`/${attr}/` + `${item.id}` + `/${attr}_data`, function (data) {
      $('ul').html('');

      appendContent(data);
    });
  });
}

function addFormListener () {
  $('form').submit(function(event) {
    event.preventDefault();

    var id = event.target.id.split("_")[2];
    var values = $(this).serialize();

    var posting = $.post(`/users/${id}`, values, function(data) {
      var response = data;
    }, "json");

    posting.done(function(response) {
      $.ajax({
        url: `/users/${response.id}/${response.action}/new`,
        dataType: 'script',
        success: function () {
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
      });
    });

  });
}
