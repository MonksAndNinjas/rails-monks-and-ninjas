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
