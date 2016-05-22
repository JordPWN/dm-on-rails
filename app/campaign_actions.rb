helpers do
	def owns_campaign
		@campaign = Campaign.find params[:id]
		if !@user.campaigns
	    halt 403 
	  end
	end
end


get '/campaigns' do
	erb :'index'
end

post '/campaigns/:id/copy' do
	redirect "/users/signup" unless logged_in?
	campaign = Campaign.find(params[:id])
	new_campaign = Campaign.create(
		title: campaign.title,
		user_id: current_user.id,
		origin: campaign.user_id,
		url: campaign.url,
		description: campaign.description
		)
	campaign.beats.each do |beat|
		Beat.create(
			ordinance: beat.ordinance,
			content: beat.content,
			campaign_id: new_campaign.id
			)
	end
	redirect "/campaigns/#{new_campaign.id}"
end

get '/campaigns/new' do
  erb :'/campaigns/new'
end

get '/campaigns/:id' do
	@campaign = Campaign.find params[:id]
  erb :'/campaigns/show'
end

get '/campaigns/:id/edit' do
	@campaign = Campaign.find params[:id]
	erb :'/campaigns/edit'
	# owns_campaign
end

post '/campaigns/:id/post' do

end

get '/campaigns/delete' do
	# owns_campaign
end

post '/campaigns/new' do
	redirect "/users/signup" unless logged_in?
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

post '/campaigns/:id/edit' do
	campaign = Campaign.find params[:id]
	campaign.update(
		title: params[:title],
		url: params[:url],
		description: params[:description],
	)
	params[:beats].each_with_index do |updated, index|
		if index < campaign.beats.count
			campaign.beats.find_by(ordinance: index).update(content: updated)
		else
			campaign.beats.create(
				ordinance: index,
				content: updated
				)
		end
	end

	redirect "/campaigns/#{campaign.id}"
end


get '/campaigns/:id/play' do
	redirect "/users/signup" unless logged_in?
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