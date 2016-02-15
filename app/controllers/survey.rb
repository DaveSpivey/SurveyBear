get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  if session[:user_id]
    erb :"surveys/show"
  else
    redirect '/sessions/new'
  end
end

post '/surveys/:id' do
  puts params


  redirect '/'
end

