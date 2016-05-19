get '/campaigns' do
end

get '/campaigns/new' do
  erb :'/campaigns/new'
end

get '/campaigns/:id' do
  erb :'/campaigns/show'
end

get '/campaigns/:id/edit' do
end

get '/campaigns/delete' do
end

post '/campaigns/new' do
	# logic for making a new campaign
end

post '/campaigns/edit' do
end