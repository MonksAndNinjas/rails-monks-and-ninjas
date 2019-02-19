// Retrieves user data
function getUserData (data) {
  current_user.current_attr = $(data).attr("name");

  $('.loader').show();
  $.getJSON("/users/" + current_user.id + "/user_data", { destination: current_user.current_attr }, function(data) {
    var attr_data = $(data).attr(`${current_user.current_attr}`);
// Reset fields
    $('.attr-title').html(`${current_user.current_attr}`);
    $('article').html('');
    resetFields();

    addNewAction();
    getData(attr_data);
  })
  .always(function () {
    $(".loader").hide();
  });
}

// Retrieves attr data and adds listeners
function getData (attr_data) {
  attr_data.forEach(function(item, index, arr) {
    item = new Item(item);

    item.appendTitle();
    addItemListener(item);
  });
}

function resetFields () {
  $('ul').remove();
  $('.actions').html('');
}
