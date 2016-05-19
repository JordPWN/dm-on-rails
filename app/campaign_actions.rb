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
end

get '/campaigns/delete' do
end

post '/campaigns/new' do
	new_campaign = Campaign.create(
		title: params[:title],
		user: current_user
	)
	params[:beats].each do |new_beat, index|
		new_campaign.beats.create(
			order: index,
			content: new_beat
		)
	end
	redirect "/campaigns/#{new_campaign.id}"
end

post '/campaigns/edit' do
end

get '/campaigns/play' do
	erb :'campaigns/play'
end