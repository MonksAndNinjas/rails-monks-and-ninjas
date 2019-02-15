var current_user;

function User(current_attr) {
  this.id = $('.my-life-links').attr("data-id");
  this.current_attr = current_attr;
}
// Retrieves user data
function getUserData (data) {
  var attr = $(data).attr("name");

  $('.loader').show();
  $.getJSON("/users/" + current_user.id + "/user_data", function(user_data) {
    var attr_data = $(user_data).attr(`${attr}`);
// Reset fields                                **maybe add to a reset fields function**
    $('article').html('');
    $('.attr-title').html(`${attr}`);
    $('ul').remove();
    $('.actions').html('');

    addNewAction(attr);
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
