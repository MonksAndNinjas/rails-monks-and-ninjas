// Retrieves user data
function getUserData (data) {
  var attr = $(data).attr("name");
  var id = $(data).data("id");

  $.getJSON("/users/" + id + "/user_data", function(user_data) {
    var attr_data = $(user_data).attr(`${attr}`);
// Reset fields                                **maybe add to a reset fields function**
    $('article').html('');
    $('ul').html('');
    $('.attr-actions').html('');
    $('.attr-title').html(`${attr}`);

    addNewAction(attr, id);
    getData(attr_data, attr);
  });
}

// Retrieves attr data and adds listeners      **maybe refactor so it is dry**
function getData (attr_data, attr) {
  attr_data.forEach(function(item, index, arr) {
    if (item.name) {
      appendTitle(attr, item.name, item.id);
      addListener(attr, item);

    } else if (item.title) {
      appendTitle(attr, item.title, item.id);
      addListener(attr, item);

    } else if (item.source) {
      appendTitle(attr, item.source, item.id);
      addListener(attr, item);
    }
  });
}
