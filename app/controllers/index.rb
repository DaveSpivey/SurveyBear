get '/' do
  @users = User.all
  @surveys = Survey.all
  erb :"index"
end

get '/secret' do
  redirect '/sessions/new' unless session[:user_id]
  "Secret area!"
end
