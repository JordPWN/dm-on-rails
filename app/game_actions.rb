get '/games' do
	#display your current games
end

post '/games/:id/save' do
	@request_payload = JSON.parse request.body.read
	@game_id = @request_payload[:game_id]
	@beat_id = @request_payload[:beat_id]
	@my_game = Game.find(@game_id)
	@my_game.beat = @beat_id
	@my_game.save

	# Games.find[:id].beat = @request_playload[:beat_id]
	#GET JSON -done-
	#GET GAME
	#SET BEAT OF GAME
	#SAVE GAME

end