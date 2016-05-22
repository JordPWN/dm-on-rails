# Homepage (Root path)
require_relative 'user_actions'
require_relative 'game_actions'
require_relative 'campaign_actions'
require_relative 'beats_actions'
require 'sinatra/base'


before do
  @current_page = 0
  @total_pages = 0
  @records_per_page = 6
	@user = User.find(session['user_id']) if session['user_id']
end

helpers do
  def logged_in?
    !@user.nil?
  end

  def owns_campaign
    @campaign = Campaign.find params[:id]
    if !@user.campaigns
      halt 403 
    end
  end
end

get '/' do
  @campaigns = Campaign.all.order(created_at: :DESC)
  @featured_campaigns = @campaigns.limit(2)
  @other_campaigns = @campaigns.offset(2)
  @total_pages = ((@campaigns.length.to_f)/@records_per_page.to_f).to_f
  @total_pages = @total_pages.ceil
  
  if params[:pageid]==nil
    @current_page = 1
    @endIndex = (@current_page * @records_per_page)-1 # because of the index that starts with 0
    @startIndex = @endIndex - @records_per_page
  else
    @current_page = params[:pageid].to_i
    @endIndex = (@current_page * @records_per_page)-1 # because of the index that starts with 0
    @startIndex = @endIndex - (@records_per_page-1)
  end

  erb :'index'
end






