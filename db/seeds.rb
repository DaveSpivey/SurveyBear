require 'faker'

User.delete_all

#create 10 dummy users
users = 10.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

50.times do
 Survey.create!( :title => Faker::Company.name,
                :creator_id  => rand(1..10))
 # newsurvey = Survey.new(:title => Faker::Company.name)
 # User.first.created_surveys << newsurvey
end



100.times do
  Question.create!(:body => Faker::Lorem.sentence + "?",
                  :survey_id => rand(1..50)
                  )
end



500.times do
  Choice.create!(:description => Faker::Commerce.color,
                  :question_id => rand(1..100))
end


