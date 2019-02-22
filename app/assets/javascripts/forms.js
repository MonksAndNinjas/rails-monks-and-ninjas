// Retrieves form for the attribute
function getNewForm () {
  if (current_user.current_attr === "quests") current_user.current_objective = $(this.target).data("id").split("-")[1];

  var url = current_user.url_new();
  loadForm(url);
}

function getEditForm () {
  var url = current_user.url_edit();
  loadForm(url);
}

// Makes request to load form
function loadForm (url) {
  resetFields();

  $.ajax({
    url: url,
    dataType: 'script',
    success: () => addFormListener()
  });
}
