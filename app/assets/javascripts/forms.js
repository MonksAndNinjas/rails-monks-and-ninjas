// Retrives form for long or short quest
function getQuestForm (event, id) {
  var data = $(event.target).data("id").split("-");
  var attr = data[0];
  var objectiveID = data[1];
  var url = `/users/${id}/objectives/${objectiveID}/${attr}/new`;

  resetFields();
  loadForm(url);
}

// Retrieves form for the attribute
function getForm (event, id) {
  var attr = $(event.target).data("id");
  var url = `/users/${id}/${attr}/new`;

  resetFields();
  loadForm(url);
}

function getEditForm (event, data) {
  var attr_data = $(event).data("id").split("-");
  var attr = attr_data[0];
  var attr_id = attr_data[1];
  var id = $('.attr').first().data("id");
  var url = `/users/${id}/${attr}/${attr_id}/edit`;

  if (attr === "quests") {
    url = `/users/${id}/objectives/${data.objective_id}/quests/${attr_id}/edit`;
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
