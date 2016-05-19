helpers do
	def owns_campaign
		@campaign = Campaign.find params[:id]
		if !current_user.campaigns
	    halt 403 
	  end
	end
end


get '/campaigns' do
end

get '/campaigns/new' do
  erb :'/campaigns/new'
end

get '/campaigns/:id' do
	@campaign = Campaign.find params[:id]
  erb :'/campaigns/show'
end

get '/campaigns/:id/edit' do
	# owns_campaign
end

get '/campaigns/delete' do
	# owns_campaign
end

post '/campaigns/new' do
	new_campaign = Campaign.create(
		title: params[:title],
		user: current_user
	)
	index = 0
	params[:beats].each do |new_beat|
		new_campaign.beats.create(
			order: index,
			content: new_beat
		)
		index += 1
	end
	redirect "/campaigns/#{new_campaign.id}"
end

post '/campaigns/edit' do
end

get '/campaigns/:id/play' do
	# @my_beat = current_user.game.find_by(campaign_id: params[:id])
	@my_beat = 0
	@campaign = Campaign.find params[:id]
	@campaign_beats = @campaign.beats.order(:order)
	erb :'campaigns/play'
end

get '/campaigns/:id/play/:beat' do


end