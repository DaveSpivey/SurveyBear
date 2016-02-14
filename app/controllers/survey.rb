get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :"surveys/show"
end
