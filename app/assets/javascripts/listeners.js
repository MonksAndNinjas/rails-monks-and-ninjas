// Add Event Listeners to names, sources, or titles from attr list
function addListener (attr, item) {
  document.getElementById(`${attr}-${item.id}`).addEventListener("click", function() {
    $.getJSON(`/${attr}/` + `${item.id}` + `/${attr}_data`, function (data) {
      console.log(data);
      $('ul').html('');

      if (attr === "inspirations" || attr === "family_members" || attr === "quests") {
        addEditAction(attr, item.id, data);
      }
// Displays content for the specific attr object
      appendContent(data);
    });
  });
}

// Adds form submission listener and makes a request
function addFormListener () {
  $('form').submit(function(event) {
    event.preventDefault();

    var id = event.target.id.split("_")[2];
    var values = $(this).serialize();

    var posting = $.post(`/users/${id}`, values, function(data) {
      var response = data;
    }, "json");

    posting.done(function(response) {
      handleResponse(response);
    });
  });
}
