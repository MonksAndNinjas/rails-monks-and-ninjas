var idCount = 0;

function displayEditLink () {
  if (c() > 21) quest.editQuest();
}

function nextQuest () {
    $('.actions').append(`<button class="next-action">Next Quest</button>`);
    attachListener();
}

function attachListener () {
  $('.next-action').on("click", () => getQuestData.apply(idCount++));
}

function getQuestData () {
  var id = $('.container').attr("data-id");

  $.getJSON("/users/" + id + "/user_data", { destination: 'quests' }, function(data) {
    if (idCount > data.quests.length - 1) idCount = 0;

    $.getJSON("/quests/" + data.quests[idCount].id + "/quests_data", { extended_data: 'true' }, function(quest_data) {
      var attributes = {};

      $('.actions').html('');
      $.extend(attributes, data.quests[idCount], quest_data);

      quest = new Quest(attributes);

      displayQuest();

      displayEditLink();

      nextQuest();
    });
  });
}

function displayQuest () {
  $.each(quest, (index, value) => console.log(index,value));
  //  $('section').append(`<ul></ul>`);
    //$.each(this, (index, value) => $('ul').append(`<li>${index}: ${value}</li><hr>`));
}
