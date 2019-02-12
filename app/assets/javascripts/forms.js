// Retrives form for long or short quest
function getQuestForm (event, id) {
  var data = $(event.target).data("id").split("-");
  var attr = data[0];
  var objectiveID = data[1];
  var url = `/users/${id}/objectives/${objectiveID}/${attr}/new`;

  $('.attr-actions').html('');
  $('ul').html('');

  loadForm(url);
}

// Retrieves form for the attribute
function getForm (event, id) {
  var attr = $(event.target).data("id");
  var url = `/users/${id}/${attr}/new`;

  $('.attr-actions').html('');
  $('ul').html('');

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
