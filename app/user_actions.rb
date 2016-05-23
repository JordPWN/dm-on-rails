get '/signup' do
end

post '/signup' do
end

get '/login' do
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end

get '/login/as/:user_id' do |user_id|
  session[:user_id] = user_id
  session[:user_name] = User.find(user_id).username
  redirect '/'
end

get '/mygames' do
	@current_user = @user
	@games = Game.where(user_id: @user)
	@created_campaigns = Campaign.where(user_id: @user)
	erb :'/users/my_games'
end