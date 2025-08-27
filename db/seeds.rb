# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_by(username: "tigertalk")&.destroy

tiger_talk = User.create!(
  email: "tigertalk@example.com",
  password: "password123",
  password_confirmation: "password123",
  username: "tigertalk",
  name: "Tiger Talk",
  bio: "The official Tiger Talk account 🐯"
)

File.open(Rails.root.join("app/assets/images/logo.png")) do |file|
  tiger_talk.profile_image.attach(
    io: file,
    filename: "logo.png",
    content_type: "image/png"
  )
end


puts "Seeded user: @#{tiger_talk.username} with profile image"
