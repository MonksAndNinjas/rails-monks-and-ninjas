// Add Event Listeners to names, sources, or titles from attr list
function addItemListener (item) {
  document.getElementById(`${current_user.current_attr}-${item.id}`).addEventListener("click", function() {
    $.getJSON(`/${current_user.current_attr}/` + `${item.id}` + `/${current_user.current_attr}_data`, function (data) {
      current_user.current_item = item;

      $('section').html('');

      if ($('.new-action').length === 0) addNewAction();
      if (["inspirations", "family_members", "quests"].includes(current_user.current_attr)) addEditAction.apply(data);
      addDeleteAction();
// Displays content for the specific attr object
      appendContent.apply(data);
    });
  });
}

function addNewListener () {
  $('.new-action').on("click", () => getNewForm.apply(event));
}

function addEditListener () {
  $('.edit-action').on("click", () => getEditForm());
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

        var aTag = $(`a[id="${current_user.current_attr}-${current_user.current_item.id}"]`);

        aTag.next().next().remove();
        aTag.next().remove();
        aTag.remove();

        addNewAction();
      }
    });
  });
}

// Adds form submission listener and makes a request
function addFormListener () {
  $('form').submit(function(event) {
    event.preventDefault();

    var values = $(this).serialize();

    var posting = $.post(`/users/${current_user.id}`, values, (data) => { var response = data }, "json");

    posting.done( (response) => handleResponse(response));
  });
}
