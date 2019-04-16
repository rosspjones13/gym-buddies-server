require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

all_users = [
  {first_name: "Ross", last_name: "Jones", username: "ross", password: "pass", location: 21117, status: "offline"},
  {first_name: "Adrienne", last_name: "Agostini", username: "adrienne", password: "pass", location: 21117, status: "offline"},
  {first_name: "Chine", last_name: "Anikwe", username: "chine", password: "pass", location: 20005, status: "offline"},
  {first_name: "Shannon", last_name: "Nabors", username: "shannon", password: "pass", location: 20005, status: "offline"},
  {first_name: "James", last_name: "Clement", username: "james", password: "pass", location: 20005, status: "offline"},
  {first_name: "Artem", last_name: "Metelskyi", username: "artem", password: "pass", location: 20005, status: "offline"},
  {first_name: "Phil", last_name: "Hartley", username: "phil", password: "pass", location: 20005, status: "offline"},
  {first_name: "Hai", last_name: "Nguyen", username: "hai", password: "pass", location: 20005, status: "offline"}, 
  {first_name: "Andrea", last_name: "Williams", username: "andrea", password: "pass", location: 20005, status: "offline"},
  {first_name: "Heloise", last_name: "Taillet", username: "heloise", password: "pass", location: 20005, status: "offline"},
  {first_name: "Kyle", last_name: "Houghton", username: "kyle", password: "pass", location: 20005, status: "offline"},
  {first_name: "Anthony", last_name: "Gregg", username: "ant", password: "pass", location: 20004, status: "offline"},
  {first_name: "Chris", last_name: "Jones", username: "chris", password: "pass", location: 20004, status: "offline"},
  {first_name: "Ryan", last_name: "Gill", username: "ryan", password: "pass", location: 20004, status: "offline"},
  {first_name: "Shinik", last_name: "Cupo", username: "shinik", password: "pass", location: 20004, status: "offline"},
  {first_name: "Benjamin", last_name: "Addai", username: "benjamin", password: "pass", location: 20004, status: "offline"},
  {first_name: "Ben", last_name: "Yellin", username: "ben", password: "pass", location: 20004, status: "offline"},
  {first_name: "Matthew", last_name: "Kay", username: "matthew", password: "pass", location: 20004, status: "offline"},
  {first_name: "Will", last_name: "Ley", username: "will", password: "pass", location: 20004, status: "offline"},
  {first_name: "Jonnel", last_name: "Benjamin", username: "jonnel", password: "pass", location: 20004, status: "offline"}
  # {first_name: "Jonnel", last_name: "Benjamin", username: "will", password: "pass", location: 20004, status: "offline"}
]

rando_users = [
  {first_name: "Jim", last_name: "Buddie", username: "jim", password: "pass", location: 20005, status: "offline"},
  {first_name: "Gal", last_name: "Fitz", username: "gal", password: "pass", location: 20005, status: "offline"},
  {first_name: "Wate", last_name: "Lyft", username: "wate", password: "pass", location: 20005, status: "offline"}
]

created_users = all_users.map {|user| User.create(user)}

created_randos = rando_users.map {|user| User.create(user)}

all_buddies = []

created_users.each do |user|
  created_users.each do |user_buddy|
    if user != user_buddy
      request = {requester: user, requestee: user_buddy, buddy_type: "friends"}
      receive = {requester: user_buddy, requestee: user, buddy_type: "friends"}
      if !all_buddies.include?(request) && !all_buddies.include?(receive)
        all_buddies << request
      end
    end
  end
end

created_buddies = all_buddies.map {|buddies| Buddy.create(buddies)}

created_buddies.each do |buddy_convo|
  10.times do |i|
    Message.create({user: buddy_convo.requester, buddy: buddy_convo, content: Faker::TvShows::GameOfThrones.quote, read: true})
    Message.create({user: buddy_convo.requestee, buddy: buddy_convo, content: Faker::TvShows::GameOfThrones.quote, read: true})
  end
end


all_goals = created_users.map do |user|
  random_weight = Random.new.rand(120...225)
  random_strength = Random.new.rand(100...225)
  random_time = Random.new.rand(360...500)
  [{goal_type: "weight", measurable_achievement: random_weight, achieve_date: Faker::Date.forward(random_strength), user: user},
  {goal_type: "time", measurable_achievement: random_time, achieve_date: Faker::Date.forward(random_weight), user: user},
  {goal_type: "strength", measurable_achievement: random_strength, achieve_date: Faker::Date.forward(random_time), user: user}]
end

created_goals = all_goals.map {|goal| Goal.create(goal)}

arm_exercises = [
  {
    name: "Bench Press Narrow Grip", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/88/Narrow-grip-bench-press-1.png",
    end_image: "https://wger.de/media/exercise-images/88/Narrow-grip-bench-press-2.png"
  },
  {
    name: "Bicep Curls With Cable", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/129/Standing-biceps-curl-1.png",
    end_image: "https://wger.de/media/exercise-images/129/Standing-biceps-curl-2.png"
  },
  {
    name: "Bicep Curls With Barbell", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/74/Bicep-curls-1.png",
    end_image: "https://wger.de/media/exercise-images/74/Bicep-curls-2.png"
  },
  {
    name: "Bicep Curls With Dumbbell", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/81/Biceps-curl-1.png",
    end_image: "https://wger.de/media/exercise-images/81/Biceps-curl-2.png"
  },
  {
    name: "Dips", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/82/Tricep-dips-2-1.png",
    end_image: "https://wger.de/media/exercise-images/82/Tricep-dips-2-2.png"
  },
  {
    name: "French Press", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/84/Lying-close-grip-triceps-press-to-chin-1.png",
    end_image: "https://wger.de/media/exercise-images/84/Lying-close-grip-triceps-press-to-chin-2.png"
  },
  {
    name: "Hammercurls", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/86/Bicep-hammer-curl-1.png",
    end_image: "https://wger.de/media/exercise-images/86/Bicep-hammer-curl-2.png"
  },
  {
    name: "Hammercurls on Cable", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/138/Hammer-curls-with-rope-1.png",
    end_image: "https://wger.de/media/exercise-images/138/Hammer-curls-with-rope-2.png"
  },
  {
    name: "Preacher Curls", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/193/Preacher-curl-3-1.png",
    end_image: "https://wger.de/media/exercise-images/193/Preacher-curl-3-2.png"
  },
  {
    name: "Push Ups", 
    category: "Arms", 
    start_image: "https://wger.de/media/exercise-images/195/Push-ups-1.png",
    end_image: "https://wger.de/media/exercise-images/195/Push-ups-2.png"
  }
]

leg_exercises = [
  {
    name: "Dumbbell Lunges Walking", 
    category: "Legs", 
    start_image: "https://wger.de/media/exercise-images/113/Walking-lunges-3.png",
    end_image: "https://wger.de/media/exercise-images/113/Walking-lunges-4.png"
  },
  {
    name: "Front Squats", 
    category: "Legs", 
    start_image: "https://wger.de/media/exercise-images/191/Front-squat-1-857x1024.png",
    end_image: "https://wger.de/media/exercise-images/191/Front-squat-2-857x1024.png"
  },
  {
    name: "Good Mornings", 
    category: "Legs", 
    start_image: "https://wger.de/media/exercise-images/116/Good-mornings-2.png",
    end_image: "https://wger.de/media/exercise-images/116/Good-mornings-1.png"
  },
  {
    name: "Leg Curls (laying)", 
    category: "Legs", 
    start_image: "https://wger.de/media/exercise-images/154/lying-leg-curl-machine-large-1.png",
    end_image: "https://wger.de/media/exercise-images/154/lying-leg-curl-machine-large-2.png"
  },
  {
    name: "Leg Curls (sitting)", 
    category: "Legs", 
    start_image: "https://wger.de/media/exercise-images/117/seated-leg-curl-large-1.png",
    end_image: "https://wger.de/media/exercise-images/117/seated-leg-curl-large-2.png"
  },
  {
    name: "Leg Extension", 
    category: "Legs", 
    start_image: "https://wger.de/media/exercise-images/177/Seated-leg-curl-1.png",
    end_image: "https://wger.de/media/exercise-images/177/Seated-leg-curl-2.png"
  },
  {
    name: "Squats", 
    category: "Legs", 
    start_image: "https://wger.de/media/exercise-images/111/Wide-stance-squat-2.gif",
    end_image: "https://wger.de/media/exercise-images/111/Wide-stance-squat-1.gif"
  },
  {
    name: "Leg Press", 
    category: "Legs", 
    start_image: "https://wger.de/media/exercise-images/130/Narrow-stance-hack-squats-1-1024x721.png",
    end_image: "https://wger.de/media/exercise-images/130/Narrow-stance-hack-squats-2-1024x721.png"
  }
]

ab_exercises = [
  {
    name: "Crunches", 
    category: "Abs", 
    start_image: "https://wger.de/media/exercise-images/91/Crunches-1.png",
    end_image: "https://wger.de/media/exercise-images/91/Crunches-2.png"
  },
  {
    name: "Leg Raises, Lying", 
    category: "Abs", 
    start_image: "https://wger.de/media/exercise-images/125/Leg-raises-2.png",
    end_image: "https://wger.de/media/exercise-images/125/Leg-raises-1.png"
  },
  {
    name: "Negative Crunches", 
    category: "Abs", 
    start_image: "https://wger.de/media/exercise-images/93/Decline-crunch-1.png",
    end_image: "https://wger.de/media/exercise-images/93/Decline-crunch-2.png"
  },
  {
    name: "Side Crunch", 
    category: "Abs", 
    start_image: "https://wger.de/media/exercise-images/176/Cross-body-crunch-1.png",
    end_image: "https://wger.de/media/exercise-images/176/Cross-body-crunch-2.png"
  }
]

chest_exercises = [
  {
    name: "Bench Press", 
    category: "Chest", 
    start_image: "https://wger.de/media/exercise-images/192/Bench-press-1.png",
    end_image: "https://wger.de/media/exercise-images/192/Bench-press-2.png"
  },
  {
    name: "Bench Press Dumbbells", 
    category: "Chest", 
    start_image: "https://wger.de/media/exercise-images/97/Dumbbell-bench-press-1.png",
    end_image: "https://wger.de/media/exercise-images/97/Dumbbell-bench-press-2.png"
  },
  {
    name: "Butterfly", 
    category: "Chest", 
    start_image: "https://wger.de/media/exercise-images/98/Butterfly-machine-2.png",
    end_image: "https://wger.de/media/exercise-images/98/Butterfly-machine-1.png"
  },
  {
    name: "Decline Bench Press Barbell", 
    category: "Chest", 
    start_image: "https://wger.de/media/exercise-images/100/Decline-bench-press-1.png",
    end_image: "https://wger.de/media/exercise-images/100/Decline-bench-press-2.png"
  },
  {
    name: "Fly With Cable", 
    category: "Chest", 
    start_image: "https://wger.de/media/exercise-images/122/Incline-cable-flyes-1.png",
    end_image: "https://wger.de/media/exercise-images/122/Incline-cable-flyes-2.png"
  },
  {
    name: "Incline Bench Press", 
    category: "Chest", 
    start_image: "https://wger.de/media/exercise-images/163/Incline-bench-press-1.png",
    end_image: "https://wger.de/media/exercise-images/163/Incline-bench-press-2.png"
  }
]

back_exercises = [
  {
    name: "Bent Over Rowing", 
    category: "Back", 
    start_image: "https://wger.de/media/exercise-images/109/Barbell-rear-delt-row-1.png",
    end_image: "https://wger.de/media/exercise-images/109/Barbell-rear-delt-row-2.png"
  },
  {
    name: "Chin-ups", 
    category: "Back", 
    start_image: "https://wger.de/media/exercise-images/181/Chin-ups-2.png",
    end_image: "https://wger.de/media/exercise-images/181/Chin-ups-1.png"
  },
  {
    name: "Hyperextensions", 
    category: "Back", 
    start_image: "https://wger.de/media/exercise-images/128/Hyperextensions-1.png",
    end_image: "https://wger.de/media/exercise-images/128/Hyperextensions-2.png"
  },
  {
    name: "Low Row", 
    category: "Back", 
    start_image: "https://wger.de/media/exercise-images/143/Cable-seated-rows-2.png",
    end_image: "https://wger.de/media/exercise-images/143/Cable-seated-rows-1.png"
  },
  {
    name: "Rack Deadlift", 
    category: "Back", 
    start_image: "https://wger.de/media/exercise-images/161/Dead-lifts-2.png",
    end_image: "https://wger.de/media/exercise-images/161/Dead-lifts-1.png"
  },
  {
    name: "Rowing, T-bar", 
    category: "Back", 
    start_image: "https://wger.de/media/exercise-images/106/T-bar-row-1.png",
    end_image: "https://wger.de/media/exercise-images/106/T-bar-row-2.png"
  }
]

shoulder_exercises = [
  {
    name: "Lateral Raises", 
    category: "Shoulders", 
    start_image: "https://wger.de/media/exercise-images/148/lateral-dumbbell-raises-large-2.png",
    end_image: "https://wger.de/media/exercise-images/148/lateral-dumbbell-raises-large-1.png"
  },
  {
    name: "Shoulder Press, Barbell", 
    category: "Shoulders", 
    start_image: "https://wger.de/media/exercise-images/119/seated-barbell-shoulder-press-large-1.png",
    end_image: "https://wger.de/media/exercise-images/119/seated-barbell-shoulder-press-large-2.png"
  },
  {
    name: "Shoulder Press, Dumbbells", 
    category: "Shoulders", 
    start_image: "https://wger.de/media/exercise-images/123/dumbbell-shoulder-press-large-1.png",
    end_image: "https://wger.de/media/exercise-images/123/dumbbell-shoulder-press-large-2.png"
  },
  {
    name: "Shoulder Press, on Machine", 
    category: "Shoulders", 
    start_image: "https://wger.de/media/exercise-images/152/seated-shoulder-press-machine-large-1.png",
    end_image: "https://wger.de/media/exercise-images/152/seated-shoulder-press-machine-large-2.png"
  },
  {
    name: "Shrugs, Barbells", 
    category: "Shoulders", 
    start_image: "https://wger.de/media/exercise-images/150/Barbell-shrugs-1.png",
    end_image: "https://wger.de/media/exercise-images/150/Barbell-shrugs-2.png"
  },
  {
    name: "Shrugs, Dumbbells", 
    category: "Shoulders", 
    start_image: "https://wger.de/media/exercise-images/151/Dumbbell-shrugs-2.png",
    end_image: "https://wger.de/media/exercise-images/151/Dumbbell-shrugs-1.png"
  }
]

cardio_exercises = [
  {
    name: "Running", 
    category: "Cardio", 
    start_image: "https://workoutlabs.com/train/svg.php?id=5713",
    end_image: "https://workoutlabs.com/train/svg.php?id=5963"
  },
  {
    name: "Swimming", 
    category: "Cardio", 
    start_image: "https://workoutlabs.com/train/svg.php?id=10239",
    end_image: "https://workoutlabs.com/train/svg.php?id=10238"
  },
  {
    name: "Biking", 
    category: "Cardio", 
    start_image: "https://workoutlabs.com/train/svg.php?id=10681",
    end_image: "https://workoutlabs.com/train/svg.php?id=10682"
  },
  {
    name: "Stationary Biking", 
    category: "Cardio", 
    start_image: "https://workoutlabs.com/train/svg.php?id=5714",
    end_image: "https://workoutlabs.com/train/svg.php?id=5964"
  },
  {
    name: "Walking", 
    category: "Cardio", 
    start_image: "https://workoutlabs.com/train/svg.php?id=12879",
    end_image: "https://workoutlabs.com/train/svg.php?id=12880"
  }
]

all_created_exercises = []

created_exercises_separated = []

created_arm_exercises = arm_exercises.map do |exercise|
  created = Exercise.create(exercise)
  all_created_exercises << created
  created
end

created_exercises_separated << created_arm_exercises

created_leg_exercises = leg_exercises.map do |exercise|
  created = Exercise.create(exercise)
  all_created_exercises << created
  created
end

created_exercises_separated << created_leg_exercises

created_ab_exercises = ab_exercises.map do |exercise|
  created = Exercise.create(exercise)
  all_created_exercises << created
  created
end

created_exercises_separated << created_ab_exercises

created_chest_exercises = chest_exercises.map do |exercise|
  created = Exercise.create(exercise)
  all_created_exercises << created
  created
end

created_exercises_separated << created_chest_exercises

created_back_exercises = back_exercises.map do |exercise|
  created = Exercise.create(exercise)
  all_created_exercises << created
  created
end

created_exercises_separated << created_back_exercises

created_shoulder_exercises = shoulder_exercises.map do |exercise|
  created = Exercise.create(exercise)
  all_created_exercises << created
  created
end

created_exercises_separated << created_shoulder_exercises

created_cardio_exercises = cardio_exercises.map do |exercise|
  created = Exercise.create(exercise)
  all_created_exercises << created
  created
end

created_exercises_separated << created_cardio_exercises

all_workouts = []

created_users.each do |user|
  counter = 0
  20.times do |week|
    day = 1
    skip_day_1 = Faker::Number.between(1, 7)
    skip_day_2 = Faker::Number.between(1, 7)
    while skip_day_1 == skip_day_2
      skip_day_2 = Faker::Number.between(1, 7)
    end
    skip_day_3 = Faker::Number.between(1, 7)
    while skip_day_1 == skip_day_3 || skip_day_2 == skip_day_3
      skip_day_3 = Faker::Number.between(1, 7)
    end
    while day <= 7 do
      if day == skip_day_1 || day == skip_day_2 || day == skip_day_3
        day += 1
      else
        Faker::Number.between(3,6).times do |set|
          case counter
          when 0
            all_workouts << {
              reps: Faker::Number.between(5,15), 
              measurable_amount: Faker::Number.between(50,150), 
              workout_date: Date.today - (week * 7 + day), 
              exercise: created_arm_exercises.sample,
              user: user
            }
          when 1
            all_workouts << {
              reps: Faker::Number.between(5,15), 
              measurable_amount: Faker::Number.between(50,150), 
              workout_date: Date.today - (week * 7 + day), 
              exercise: created_leg_exercises.sample,
              user: user
            }
          when 2
            all_workouts << {
              reps: Faker::Number.between(5,15), 
              measurable_amount: Faker::Number.between(50,150), 
              workout_date: Date.today - (week * 7 + day), 
              exercise: created_ab_exercises.sample,
              user: user
            }
          when 3
            all_workouts << {
              reps: Faker::Number.between(5,15), 
              measurable_amount: Faker::Number.between(50,150), 
              workout_date: Date.today - (week * 7 + day), 
              exercise: created_chest_exercises.sample,
              user: user
            }
          when 4
            all_workouts << {
              reps: Faker::Number.between(5,15), 
              measurable_amount: Faker::Number.between(50,150), 
              workout_date: Date.today - (week * 7 + day), 
              exercise: created_back_exercises.sample,
              user: user
            }
          when 5
            all_workouts << {
              reps: Faker::Number.between(5,15), 
              measurable_amount: Faker::Number.between(50,150), 
              workout_date: Date.today - (week * 7 + day), 
              exercise: created_shoulder_exercises.sample,
              user: user
            }
          when 6
            all_workouts << {
              reps: Faker::Number.between(1,3), 
              measurable_amount: Faker::Number.between(420,600), 
              workout_date: Date.today - (week * 7 + day), 
              exercise: created_cardio_exercises.sample,
              user: user
            }
          else
            counter = 0
          end
        end
        day += 1
        counter += 1
      end
    end
  end
end

created_workouts = all_workouts.map {|workout| Workout.create(workout)}