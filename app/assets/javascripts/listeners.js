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
      if (!response) {
        alert('nope');
      };
    });

  });
}
