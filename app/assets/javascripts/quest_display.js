var idCount = 0; // Counter for displaying next quest item

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
  let id = $('.container').attr("data-id"); // Defines and retrieves user_id

  $.getJSON("/users/" + id + "/user_data", { destination: 'quests' }, function(data) {
    if (idCount > data.quests.length - 1) idCount = 0;

    $.getJSON("/quests/" + data.quests[idCount].id + "/quests_data", { extended_data: 'true' }, function(quest_data) {
      var attributes = {}; // Defines hash to be used in creation of quest object

      $('ul, .actions').html('');
      $.extend(attributes, data.quests[idCount], quest_data);

      quest = new Quest(attributes);

      displayQuest();

      displayEditLink();

      nextQuest();
    });
  });
}

function displayQuest () {
  $.each(quest.data(), (index, value) => $('ul').append(`<li>${index}: ${value}</li><hr>`));
}
