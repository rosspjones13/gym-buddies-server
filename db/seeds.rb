require 'database_cleaner'
require 'faker'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

all_users = [
  {first_name: "Ross", last_name: "Jones", username: "ross", password: "pass", location: 21117},
  {first_name: "Adrienne", last_name: "Agostini", username: "adrienne", password: "pass", location: 21117},
  {first_name: "Chine", last_name: "Anikwe", username: "chine", password: "pass", location: 20005},
  {first_name: "Shannon", last_name: "Nabors", username: "shannon", password: "pass", location: 20005},
  {first_name: "James", last_name: "Clement", username: "James", password: "pass", location: 20005},
]

created_users = all_users.map {|user| User.create(user)}

all_buddies = [
  {requester: created_users[0], requestee: created_users[1], buddy_type: "friends"},
  {requester: created_users[2], requestee: created_users[0], buddy_type: "friends"},
  {requester: created_users[0], requestee: created_users[3], buddy_type: "friends"},
  {requester: created_users[0], requestee: created_users[4], buddy_type: "pending"},
]

created_buddies = all_buddies.map {|buddies| Buddy.create(buddies)}

created_buddies.each do |buddy_convo|
  10.times do |i|
    Message.create({user: buddy_convo.requester, buddy: buddy_convo, content: Faker::TvShows::GameOfThrones.quote})
    Message.create({user: buddy_convo.requestee, buddy: buddy_convo, content: Faker::TvShows::GameOfThrones.quote})
  end
end