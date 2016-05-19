# Homepage (Root path)
require_relative 'user_actions'
require_relative 'game_actions'
require_relative 'campaign_actions'
require_relative 'beats_actions'

helpers do

  def current_user
    user_id = session['user_id']
    user_id.nil? ? nil : User.find(user_id)
  end

  def logged_in?
    !current_user.nil?
  end

end


get '/' do
  erb :index
end