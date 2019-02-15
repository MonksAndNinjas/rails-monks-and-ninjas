// Add Event Listeners to names, sources, or titles from attr list
function addListener (item) {
  document.getElementById(`${current_user.current_attr}-${item.id}`).addEventListener("click", function() {
    $.getJSON(`/${current_user.current_attr}/` + `${item.id}` + `/${current_user.current_attr}_data`, function (data) {
      $('section').html('');

      if ($('.new-action').length === 0) {
        addNewAction(item.id);
      }

      if (current_user.current_attr === "inspirations" || current_user.current_attr === "family_members" || current_user.current_attr === "quests") {
        addEditAction(item.id, data);
      }
// Displays content for the specific attr object
      appendContent(data);
      addDeleteAction(item.id, data);
    });
  });
}

// Adds form submission listener and makes a request
function addFormListener () {
  $('form').submit(function(event) {
    event.preventDefault();

    var values = $(this).serialize();

    var posting = $.post(`/users/${current_user.id}`, values, function(data) {
      var response = data;
    }, "json");

    posting.done(function(response) {
      handleResponse(response);
    });
  });
}
