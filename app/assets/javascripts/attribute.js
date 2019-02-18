const attributes = ["disciplines", "inspirations", "subscriptions", "quests", "priority_items", "family_members"];

function createAttrObjects () {
  for (var attribute of attributes) {
    attribute = new Attribute(attribute);
    console.log(attribute);
  }
}

function Attribute (name) {
  this.name = name;
}
