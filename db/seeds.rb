# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    name: "Kumiko",
    email: "kumiko@email.com",
    password: "password",
    password_confirmation: "password"
)

User.create!(
    name: "AdminUser",
    email: "framgia@email.com",
    password: "password",
    password_confirmation: "password",
    admin: true
)

20.times do |n|
    Category.create!(
        title: "Category#{n + 1}",
        description: "It is about Category#{n + 1}.",
    )
end

categories = Category.order(:created_at)
5.times do
    words = Faker::Lorem.sentence(3)
    categories.each { |category| category.words.create!(words: words)}
end

# More than 1 user
99.times do |n|
    name = Faker::Name.name #this is from FAKER website
    email = "user#{n}@email.com"
    password = "password"

    User.create!(
        name: name,
        email: email,
        password: password,
        password_confirmation: password
    )    
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Choice.create!(
    word_id: "1",
    choices: "Fish",
    correct_ans: true
)

Choice.create!(
    word_id: "1",
    choices: "Animal",
    correct_ans: false
)

Choice.create!(
    word_id: "1",
    choices: "Fruit",
    correct_ans: false
)