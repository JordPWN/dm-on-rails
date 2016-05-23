get '/signup' do
	erb :"/users/signup"
end

post '/signup' do
	  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  @user.save
  session[:user_id] = @user.id
  redirect "/"
end

get '/login' do
	erb :'/users/login'
end

post '/login' do
  u = User.find_by(username: params[:username])
  if !u.nil? && u.password == params[:password]
    session['user_id'] = u.id
    redirect to('/')
  else
    # not found
    session['notice'] = 'could not log you in, check email or password'
    redirect to('/login')
  end
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