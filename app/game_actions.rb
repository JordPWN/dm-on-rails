get '/games' do
	#display your current games
end

post '/games/save' do
	# @request_payload = JSON.parse request.body.read
	@beat_order = params[:beat_order]
	@beat_id = Campaign.find(params[:campaign_id]).beats.find_by(ordinance: @beat_order).id
	@game = Game.find(params[:game_id]).update(beat_id: @beat_id)
end

post '/games/rating/save' do
  @campaign_rating = params[:campaign_rating]
  @game = Game.find(params[:game_id])
  @game.update(rating: @campaign_rating)
  redirect '/'
end