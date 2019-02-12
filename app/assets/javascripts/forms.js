// Retrives form for long or short quest
function getQuestForm (event, id) {
  var data = $(event.target).data("id").split("-");
  var attr = data[0];
  var objectiveID = data[1];

  $('.attr-actions').html('');
  $('ul').html('');

  $.ajax({
    url: `/users/${id}/objectives/${objectiveID}/${attr}/new`,
    dataType: 'script',
    success: function () {
      addQuestFormListener();
    }
  });
}

// Retrieves form for the attribute
function getForm (event, id) {
  var attr = $(event.target).data("id");

    $('.attr-actions').html('');
    $('ul').html('');

  $.ajax({
    url: `/users/${id}/${attr}/new`,
    dataType: 'script',
    success: function () {
      addFormListener();
    }
  });
}
