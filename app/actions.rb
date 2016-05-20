# Homepage (Root path)
require_relative 'user_actions'
require_relative 'game_actions'
require_relative 'campaign_actions'
require_relative 'beats_actions'

before do
	@user = User.find(session['user_id']) if session['user_id']
end

helpers do
  def logged_in?
    !@user.nil?
  end
end

get '/' do
  erb :index
end