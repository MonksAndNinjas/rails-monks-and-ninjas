// Retrieves user data            make this so it gets on load and put into json  object
/*function getUserData (data) {
  current_user.current_attr = $(data).attr("name");

  $('.loader').show();
  $.getJSON("/users/" + current_user.id + "/user_data", function(user_data) {
    var attr_data = $(user_data).attr(`${current_user.current_attr}`);
// Reset fields                 right here put into item object
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
    var itemName = Object.entries(item)[1][1];

    appendTitle(itemName, item.id);
    addItemListener(item);
  });
}

function resetFields () {
  $('ul').remove();
  $('.actions').html('');
}*/
