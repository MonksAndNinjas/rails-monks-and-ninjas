// Retrieves user data
function getUserData (data) {
  var attr = $(data).attr("name");
  var id = $(data).data("id");

$('.loader').show();
  $.getJSON("/users/" + id + "/user_data", function(user_data) {
    var attr_data = $(user_data).attr(`${attr}`);
// Reset fields                                **maybe add to a reset fields function**
    $('article').html('');
    $('.attr-title').html(`${attr}`);
    resetFields();

    addNewAction(attr, id);
    getData(attr_data, attr);
  })
  .always(function () {
    $(".loader").hide();
  });
}

// Retrieves attr data and adds listeners
function getData (attr_data, attr) {
  attr_data.forEach(function(item, index, arr) {
    var itemName;

    if (item.name) {
      itemName = item.name;
    } else if (item.title) {
      itemName = item.title
    } else if (item.source) {
      itemName = item.source
    }

    appendTitle(attr, itemName, item.id);
    addListener(attr, item);
  });
}


function resetFields () {
  $('ul').remove();
  $('.actions').html('');
}
