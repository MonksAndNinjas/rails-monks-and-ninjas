var idCount = 0;

function displayEditLink () {
  if (quest.objective_id === 1 && quest.count() > 21) {
    $('.actions').append(`<a href="/users/${$('.container').attr("data-id")}/` +
                         `objectives/1/quests/${quest.id}/edit">Edit Quest</a>`);
  } else if (quest.objective_id === 1 && quest.count() > 160) {
    $('.actions').append(`<a href="/users/${$('.container').attr("data-id")}/` +
                         `objectives/2/quests/${quest.id}/edit">Edit Quest</a>`);
  }
}

function nextQuest () {
    $('.actions').append(`<button class="next-action">Next Quest</button>`);
    attachListener();
}

function attachListener () {
  $('.next-action').on("click", function () {
    $('.actions').html('');
    idCount++;
    console.log(idCount);
    getQuestData();
  });
}

function getQuestData () {
  var id = $('.container').attr("data-id");

  $.getJSON("/users/" + id + "/user_data", { destination: 'quests' }, function(data) {
    if (idCount > data.quests.length - 1) {
      idCount = 0;
    }

    $.getJSON("/quests/" + data.quests[idCount].id + "/quests_data", { extended_data: 'true' }, function(quest_data) {
      var attributes = {};

      $.extend(attributes, data.quests[idCount], quest_data);

      quest = new Quest(attributes);
      console.log(quest, quest.objective(), quest.count(), quest.message());

      displayEditLink();

      nextQuest();

      // next display items in proper place
      // have funciton that gives the next quest

      // need to have one page for displaying items and another for the quest javascript class -- .js
      // split pages so not loading the pages in my_life
    });
  });
}
