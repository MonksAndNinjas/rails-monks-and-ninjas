// Retrives form for long or short quest
function getQuestForm (event) {
  var data = $(event.target).data("id").split("-");
  var objectiveID = data[1];
  var url = `/users/${current_user.id}/objectives/${objectiveID}/${current_user.current_attr}/new`;

  resetFields();
  loadForm(url);
}

// Retrieves form for the attribute
function getForm (event) {
  var url = `/users/${current_user.id}/${current_user.current_attr}/new`;

  resetFields();
  loadForm(url);
}

function getEditForm (event, data) {
  var attr_data = $(event).data("id").split("-");
  var attr_id = attr_data[1];
  var url = `/users/${current_user.id}/${current_user.current_attr}/${attr_id}/edit`;

  if (current_user.current_attr === "quests") {
    url = `/users/${current_user.id}/objectives/${data.objective_id}/quests/${attr_id}/edit`;
  }

  resetFields();
  loadForm(url);
}

// Makes request to load form
function loadForm (url) {
  $.ajax({
    url: url,
    dataType: 'script',
    success: function () {
      addFormListener();
    }
  });
}
