get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :"surveys/show"
end

post '/surveys/:id' do
  puts params
  puts params[:id]
  survey_taken = Survey.find(params[:id])
  
  params[:responses].values do |value| 
  	Response.create(survey_id: params[:id], taker_id: session[:user_id], choice_id: value.to_i)
  end

  redirect '/'
end

