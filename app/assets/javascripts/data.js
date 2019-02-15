var current_user;

function User(name, current_attr) {
  this.id = $('.my-life-links').attr("data-id");
  this.name = name;
  this.current_attr = current_attr;
}
// Retrieves user data
function getUserData (data) {
  current_user.current_attr = $(data).attr("name");

  $('.loader').show();
  $.getJSON("/users/" + current_user.id + "/user_data", function(user_data) {
    var attr_data = $(user_data).attr(`${current_user.current_attr}`);
// Reset fields                                **maybe add to a reset fields function**
    $('article').html('');
    $('.attr-title').html(`${current_user.current_attr}`);
    $('ul').remove();
    $('.actions').html('');

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
    var itemName;

    if (item.name) {
      itemName = item.name;
    } else if (item.title) {
      itemName = item.title
    } else if (item.source) {
      itemName = item.source
    }

    appendTitle(itemName, item.id);
    addListener(item);
  });
}


function resetFields () {
  $('ul').remove();
  $('.actions').html('');
}
