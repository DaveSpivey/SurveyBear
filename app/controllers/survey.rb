get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  if session[:user_id]
    erb :"surveys/show"
  else
    redirect '/sessions/new'
  end
end

post '/surveys/:id' do

  survey_taken = Survey.find(params[:id])

  params[:responses].values.each do |value|
  	Response.create(survey_id: params[:id], taker_id: session[:user_id], choice_id: value.to_i)
    puts value
  end

  redirect '/'
end

