# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

print("Resetting Database...\n")

PomoSession.destroy_all
User.destroy_all

print("Seeding Users...\n")

# User 1 - Student
u1 = User.create(
  username: "Student123",
  password: "password",
  password_confirmation: "password",
  daily_goal: 60,
  study_goal: "Preparing for exams",
  details: "Student studying computer science, passionate about coding."
)

# User 2 - Working Professional
u2 = User.create(
  username: "ProfeshTechie",
  password: "password",
  password_confirmation: "password",
  daily_goal: 45,
  study_goal: "Improving programming skills",
  details: "Software engineer working in a tech company, interested in machine learning."
)

# User 3 - Language Enthusiast
u3 = User.create(
  username: "PolyglotDreamer",
  password: "password",
  password_confirmation: "password",
  daily_goal: 30,
  study_goal: "Mastering multiple languages",
  details: "Linguistics major, passionate about learning new languages and cultures."
)

# User 4 - Fitness Trainer
u4 = User.create(
  username: "FitAndLearn",
  password: "password",
  password_confirmation: "password",
  daily_goal: 60,
  study_goal: "Learning about nutrition and fitness",
  details: "Personal trainer with a focus on holistic health and wellness."
)

# User 5 - Career Switcher
u5 = User.create(
  username: "CareerChanger",
  password: "password",
  password_confirmation: "password",
  daily_goal: 45,
  study_goal: "Transitioning into data science",
  details: "Former marketer looking to pivot into the field of data science."
)

print("Seeding Sessions...\n")

# Define the session types
session_types = ["Study", "Break"]

# Define the number of sessions per user
sessions_per_user = 10

# print("Today is the:", DateTime.now().day)
datetime = DateTime.now
# puts datetime
# puts datetime.wday
past_sunday = datetime - datetime.wday  # Subtract the current wday value to get the previous Sunday
puts past_sunday.day
puts datetime.day

# Define the start and end dates for the simulation period
start_date = DateTime.new(2024, 10, past_sunday.day) # simulate data from today forward
end_date = DateTime.new(2024, 10, datetime.day)

# Iterate over each user
User.all.each do |user|
  sessions_per_user.times do
    # Randomly choose a session type
    session_type = session_types.sample

    # Generate a random date within the simulation period
    session_date = rand(start_date..end_date).to_datetime.change({
      hour: rand(0..23),
      min: rand(0..59),
      sec: rand(0..59)
    })

    # Create a session with random total time (assuming it's in minutes)
    user.pomo_sessions.create(
      session_type: session_type,
      total_secs: rand(5..30) * 60, # Adjust range as needed
      session_date: session_date
      )
  end
end


print("Database Seeded!\n")
