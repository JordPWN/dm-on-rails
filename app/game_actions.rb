get '/games' do
	#display your current games
end

post '/games/save' do
	# @request_payload = JSON.parse request.body.read
	@game_id = params[:game_id]
	@beat_order = params[:beat_order]
	@campaign_id = params[:campaign_id]
	@beat_id = Campaign.find(@campaign_id).beats.find_by(ordinance: @beat_order).id
	@my_game = Game.find(@game_id).update(beat_id: @beat_id)
end