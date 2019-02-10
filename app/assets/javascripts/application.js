// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
/*//turbolinks*/
//= require_tree .
//= require jquery
//= require jquery_ujs

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

// Appends attr name, title, or source to section
function appendTitle (attr, title, id) {
  $('article').append(`<a href="#" id="${attr}-${id}">${title}</a><br>`);
}


// Appends attr content into ul tag of my_life.html.erb
function appendContent(data) {
  $.each(data, function( index, value ) {
    $('ul').append(`<li>${index}: ${value}</li>`);
  });
}

// Appends new item button
function addNewAction (attr, id) {
  if (attr === "quests") {
    $('.attr-actions')
    .append(`<button class="new-action" data-id="${attr}-1">Short ${attr}</button><br><button class="new-action" data-id="${attr}-2">Long ${attr}</button>`);

    $('.new-action').click(function() {
      getQuestForm(event, id);
    });
  } else {
    $('.attr-actions').append(`<button class="new-action" data-id="${attr}">New ${attr}</button>`);

    $('.new-action').click(function() {
      getForm(event, id);
    });
  }
}

// Retrives form for long or short quest
function getQuestForm (event, id) {
  var data = $(event.target).data("id").split("-");
  var attr = data[0];
  var objectiveID = data[1];

  $('.attr-actions').html('');
  $('ul').html('');

  $.ajax({
    url: `/users/${id}/objectives/${objectiveID}/${attr}/new`,
    dataType: 'script'
  });
}

// Retrieves form for the attribute
function getForm (event, id) {
  var attr = $(event.target).data("id");

    $('.attr-actions').html('');
    $('ul').html('');

  $.ajax({
    url: `/users/${id}/${attr}/new`,
    dataType: 'script'
  });
}

// Makes the button in Inspirations#index transparent, making only the words visible
function button_style(attr) {
  var x = document.getElementById(attr);
  if (x.style.display === "none") {
      x.style.display = "block";
  } else {
      x.style.display = "none";
  }
}
