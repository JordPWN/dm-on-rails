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
  @campaign_rating = params[:star]
  @game = Game.find(params[:'game-id'])
  @game.update(rating: @campaign_rating)
  redirect '/'
end

post '/cue/load' do	
	@beat_order = params[:beat_order]
	@beat = Campaign.find(params[:campaign_id]).beats.find_by(ordinance: @beat_order)
	@beat.cue.to_json

end