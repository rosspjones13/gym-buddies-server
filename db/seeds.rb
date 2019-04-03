require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

allUsers = [
  {first_name: "Ross", last_name: "Jones", username: "ross", password: "pass", location: 21117},
  {first_name: "Adrienne", last_name: "Agostini", username: "adrienne", password: "pass", location: 21117},
  {first_name: "Chine", last_name: "Anikwe", username: "chine", password: "pass", location: 20005},
  {first_name: "Shannon", last_name: "Nabors", username: "shannon", password: "pass", location: 20005},
  {first_name: "James", last_name: "Clement", username: "James", password: "pass", location: 20005},
]

createdUsers = allUsers.map {|user| User.create(user)}

allBuddies = [
  {requester: createdUsers[0], requestee: createdUsers[1], buddy_type: "friends"},
  {requester: createdUsers[2], requestee: createdUsers[0], buddy_type: "friends"},
  {requester: createdUsers[0], requestee: createdUsers[3], buddy_type: "friends"},
  {requester: createdUsers[0], requestee: createdUsers[4], buddy_type: "pending"},
]

allBuddies.each {|buddies| Buddy.create(buddies)}