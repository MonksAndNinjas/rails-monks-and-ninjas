// Retrieves user data - list of clicked nested attribute and the content's id and name
function getUserData (data) {
  current_user.current_attr = $(data).attr("name");

  $.getJSON("/users/" + current_user.id + "/user_data", { destination: current_user.current_attr }, function(data) {
    var attr_data = $(data).attr(`${current_user.current_attr}`);
// sets fields
    $('.attr-title').html(`${current_user.current_attr}`);
    $('section, article').html('');
    resetFields();

    addNewAction();
    getData(attr_data);
  });
}

// Retrieves attr data and adds listeners for each item
function getData (attr_data) {
  attr_data.forEach(function(item) {
    item = new Item(item);

    item.appendTitle();
    addItemListener(item);
  });
}

function resetFields () {
  $('ul').remove();
  $('.actions').html('');
}
