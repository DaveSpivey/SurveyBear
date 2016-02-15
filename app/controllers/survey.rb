get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :"surveys/show"
end

post '/surveys/:id' do
  puts params


  redirect '/'
end

