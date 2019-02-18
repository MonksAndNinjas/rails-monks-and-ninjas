// Add Event Listeners to names, sources, or titles from attr list
function addItemListener (item) {
  document.getElementById(`${current_user.current_attr}-${item.id}`).addEventListener("click", function() {
    $.getJSON(`/${current_user.current_attr}/` + `${item.id}` + `/${current_user.current_attr}_data`, function (data) {
      current_user.current_item = item;
      $('section').html('');

      if ($('.new-action').length === 0) {
        addNewAction();
      }

      if (current_user.current_attr === "inspirations" || current_user.current_attr === "family_members" || current_user.current_attr === "quests") {
        addEditAction(data);
      }
// Displays content for the specific attr object
      appendContent(data);
      addDeleteAction(data);
    });
  });
}

function addNewListener () {
  $('.new-action').click(function() {
    if (current_user.current_attr === "quests") {
      current_user.current_objective = $(event.target).data("id").split("-")[1];
    }

    getNewForm();
  });
}

function addEditListener (data) {
  $('.edit-action').on("click", function() {
    if (current_user.current_attr === "quests") {
      current_user.current_objective =  data.objective_id;
    }

    getEditForm();
  });
}

function addDeleteListener () {
  $('.delete-action').on("click", function() {
    var url = current_user.url_delete();

    resetFields();

    $.ajax({
      type: "POST",
      url: url,
      dataType: 'json',
      data: {"_method":"delete"},
      complete: function () {
        alert("Successfully Deleted");
        var user_data = $(`.attr[name="${current_user.current_attr}"]`);

        getUserData(user_data);
      }
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
