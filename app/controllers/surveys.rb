get '/users/:user_id/surveys/new' do 

  @user = User.find(params[:user_id])

  erb :'surveys/new'

end


post '/users/:user_id/surveys' do 

  @user = User.find(session[:user_id])

  @survey = Survey.new()
  @survey.title = params[:title]
    
  @question = Question.new()
  @question.body = params[:body]
  @question.survey_id = @survey.id
    
  # @choice_container = Array.new unless @choice_container && @question
  # @choice_container << params[:choice]
  
  # p '=' * 50
  # puts params[:choice]
  # puts @choice_container.count
  # p '=' * 50
  

  # if @survey.save
  #   redirect "/users/#{@user.id}/surveys"
  # else
    erb :'surveys/new'
  # end

end