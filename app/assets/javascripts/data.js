// Retrieves user data
function getUserData (user_data) {
  var attr = $(user_data).attr("name");
  var id = $(user_data).data("id");

  $.getJSON("/users/" + id + "/user_data", function(data) {
    var data_attr = $(data).attr(`${attr}`);

    $('article').html('');
    $('ul').html('');
    $('.attr-actions').html('');
    $('.attr-title').html(`${attr}`);

    addNewAction(attr, id);
    getData(data_attr, attr);
  });
}

// Retrieves attr data and adds listeners      **maybe refactor so it is dry**
function getData (data_attr, attr) {
  data_attr.forEach(function(item, index, arr) {
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
