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
}

function attachListener () {
  $('.next-action').on("click", () => getNextQuest.apply(event));
}
