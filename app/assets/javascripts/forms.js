// Retrieves appropriate data to render form for the attribute depending on the type of action
function getNewForm () {
  if (current_user.current_attr === "quests") current_user.current_objective = $(this.target).data("id").split("-")[1];

  let url = current_user.url_new();
  loadForm(url);
}

function getEditForm () {
  let url = current_user.url_edit();
  loadForm(url);
}

// Makes request to load form and attaches listener
function loadForm (url) {
  resetFields();

  $.ajax({
    url: url,
    dataType: 'script',
    success: () => addFormListener()
  });
}
