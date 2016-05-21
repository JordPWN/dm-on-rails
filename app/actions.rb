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
end

# get '/' do
#   @campaigns = Campaign.all
#   erb :index
# end

get '/' do
  @campaigns = Campaign.all
  @total_pages = ((@campaigns.length.to_f)/@records_per_page.to_f).to_f
  @total_pages = @total_pages.ceil
  # puts "WELCOME"
  # puts @total_pages

  if params[:pageid]==nil
    @current_page = 1
    @endIndex = (@current_page * @records_per_page)-1 # because of the index that starts with 0
    @startIndex = @endIndex - @records_per_page
  else
    @current_page = params[:pageid].to_i
    @endIndex = (@current_page * @records_per_page)-1 # because of the index that starts with 0
    @startIndex = @endIndex - (@records_per_page-1)
  end

  erb :index
end



# test code for pagination below:

# get '/paginate' do 
#   @campaigns = Campaign.all
#   @total_pages = ((@campaigns.length.to_f)/@records_per_page.to_f).to_f
#   @total_pages = @total_pages.ceil
#   puts "WELCOME"
#   puts @total_pages

#   if params[:pageid]==nil
#     @current_page = 1
#     @endIndex = (@current_page * @records_per_page)-1 # because of the index that starts with 0
#     @startIndex = @endIndex - @records_per_page
#   else
#     @current_page = params[:pageid].to_i
#     @endIndex = (@current_page * @records_per_page)-1 # because of the index that starts with 0
#     @startIndex = @endIndex - (@records_per_page-1)
#   end

#   erb :mypage
# end






