get 'beats/:id' do
	# actually goes to CAMPAIGN take :id and load it as a beat
	#redirect to :id's campaign == mysite.com/campaigns/campaign1 LOAD beat[1]
end

post '/beats' do
  # this is not doing anything other than printing out the submitted data, yet.
  p params[:beat]
  redirect '/campaigns/new'
end
