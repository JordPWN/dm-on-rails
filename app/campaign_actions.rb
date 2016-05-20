helpers do
	def owns_campaign
		@campaign = Campaign.find params[:id]
		if !@user.campaigns
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
		url: params[:url],
		description: params[:description],
		user_id: @user.id
	)
	index = 0
	params[:beats].each do |new_beat|
		new_campaign.beats.create(
			ordinance: index,
			content: new_beat
		)
		index += 1
	end
	redirect "/campaigns/#{new_campaign.id}"
end

post '/campaigns/edit' do
end

get '/campaigns/:id/play' do
	@campaign = Campaign.find params[:id]
	@game = @user.games.find_by(campaign_id: params[:id])
	unless @game
		@game = Game.create(
			campaign_id: @campaign.id,
			user_id: @user.id,
			beat_id: @campaign.beats.find_by(ordinance: 0).id
		)
		@beat_order = 0
	else
		@beat_order = @game.beat.ordinance
	end
	@campaign_beats = @campaign.beats.order(:ordinance)
	erb :'campaigns/play'
end

get '/campaigns/:id/play/:beat' do


end