// Retrieves form for the attribute
function getNewForm () {
  var url = current_user.url_new();

  resetFields();
  loadForm(url);
}

function getEditForm () {
  var url = current_user.url_edit();

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
