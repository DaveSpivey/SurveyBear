get '/users/:user_id/surveys/new' do 

  @user = User.find(params[:user_id])

  erb :'surveys/new'

end


post '/users/:user_id/surveys' do 

  @user = User.find(session[:user_id])

  @survey = Survey.new()
  @survey.title = params[:title]
  @survey.user_id = session[:user_id]
  @survey.save

  @question = Question.new()
  @question.body = params[:body]
  @question.survey_id = @survey.id
  @question.save
  
  @choice = Choice.new
  @choice.description = params[:description]
  @choice.question_id = @question.id
  @choice.save

  params[:choice].each do |choice|
    @choice = Choice.new
    @choice.description = choice[1]
    @choice.question_id = @question.id
    @choice.save
  end
  
  redirect "/users/#{session[:user_id]}"

end