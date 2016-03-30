# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:

User.create(
  provider: "github",
  uid: "1",
  username: "jarlax1",
  email: "jarlax1@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

User.create(
  provider: "github",
  uid: "2",
  username: "jarlax2",
  email: "jarlax2@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

User.create(
  provider: "github",
  uid: "3",
  username: "jarlax3",
  email: "jarlax3@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

User.create(
  provider: "github",
  uid: "4",
  username: "jarlax4",
  email: "jarlax4@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

Event.create(
  name: "Launcher Luncher",
  location: "Chinatown",
  description: "Eating lunch with launchers.",
  user_id: "1"
)

Event.create(
  name: "Launcher A",
  location: "Chinatown",
  description: "Eating lunch with launchers.",
  user_id: "2"
)

Event.create(
  name: "Launcher Br",
  location: "Chinatown",
  description: "Eating lunch with launchers.",
  user_id: "3"
)

Event.create(
  name: "Launcher C",
  location: "Chinatown",
  description: "Eating lunch with launchers.",
  user_id: "4"
)

UsersEvent.create(
  user_id: 1,
  event_id: 1
)

UsersEvent.create(
  user_id: 2,
  event_id: 1
)

UsersEvent.create(
  user_id: 3,
  event_id: 1
)

UsersEvent.create(
  user_id: 4,
  event_id: 1
)

UsersEvent.create(
  user_id: 4,
  event_id: 2
)

UsersEvent.create(
  user_id: 4,
  event_id: 3
)

UsersEvent.create(
  user_id: 4,
  event_id: 2
)
