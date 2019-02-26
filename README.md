# README

#Monks and Ninjas Rails Project

##Overview

The Monks and Ninjas Life Manager App allows users to efficiently structure and promote meaning in ones life. Once the app is setup the user will have access to recording family members, online subscriptions, short-term and long-term goals, weekly priorities, inspirations, and controlling bad habits.

The page 'my life', which are accessible through the icon on the top right of the screen is similar to all the other attribute pages except that it uses the Ruby code of those pages and implements it through Javascript. All the attributes and their features are accessible through just one page. The Javascript code makes use of Rails active model serializer and uses Javascript object models to make use of the JSON response.

The page 'my quests' is also accessible through the icon on the top right of the screen. This page serves as a show page for the quests attribute and it display a bit more information than normal using Javascript to handle the data.

##Installation

Once forked from github you will be required to run 'rake db:migrate and rake db:seed'.
db:seed will add the short quests and long quests.

To access the Javascript portion of the app make sure to type 'git fetch --all' and then 'git checkout monks-and-ninjas-js' to switch over to it.

Make sure to read notes in all files and primary code for views will be in layout and primary controller code will be in concerns and application_controller. This will be good places to start.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MonksAndNinjas/rails-monks-and-ninjas. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Monks and Ninjas Sinatra App project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](http://contributor-covenant.org/version/1/0/0/).
