require 'faker'

User.delete_all
Survey.delete_all
Question.delete_all
Choice.delete_all
Response.delete_all

#create 10 dummy users
users = 10.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

survey1 = Survey.create!( :title => "Food Survey", 
						  :user_id => User.all.sample(1)[0].id)

question1 = Question.create!( :body => "Which food do you prefer most?", :survey_id => survey1.id)
question2 = Question.create!( :body => "Which food do you prefer least?", :survey_id => survey1.id)

Choice.create!( :description => "Pizza", :question_id => question1.id)
Choice.create!( :description => "Hamburgers", :question_id => question1.id)
Choice.create!( :description => "Sushi", :question_id => question1.id)
Choice.create!( :description => "Burritos", :question_id => question1.id)

Choice.create!( :description => "Pizza", :question_id => question2.id)
Choice.create!( :description => "Hamburgers", :question_id => question2.id)
Choice.create!( :description => "Sushi", :question_id => question2.id)
Choice.create!( :description => "Burritos", :question_id => question2.id)


survey2 = Survey.create!( :title => "Car Survey", 
						  :user_id => User.all.sample(1)[0].id)

question3 = Question.create!( :body => "Which car do you prefer most?", :survey_id => survey2.id)
question4 = Question.create!( :body => "Which car do you prefer least?", :survey_id => survey2.id)

Choice.create!( :description => "Mustang", :question_id => question3.id)
Choice.create!( :description => "Tahoe", :question_id => question3.id)
Choice.create!( :description => "Camaro", :question_id => question3.id)
Choice.create!( :description => "Station Wagon", :question_id => question3.id)

Choice.create!( :description => "Mustang", :question_id => question4.id)
Choice.create!( :description => "Tahoe", :question_id => question4.id)
Choice.create!( :description => "Camaro", :question_id => question4.id)
Choice.create!( :description => "Station Wagon", :question_id => question4.id)

5.times do 
	survey = Survey.all.sample(1)[0]
	user = User.all.sample(1)[0]
	SurveyTaken.create(user_id: user.id, survey_id: survey.id)
	questions = Question.where(survey_id: survey.id)
	questions.each do |question|
		choice = Choice.where(question_id: question.id).sample(1)[0]
		Response.create(survey_id: survey.id, choice_id: choice.id, user_id: user.id) if survey.user_id != user.id
	end
end
