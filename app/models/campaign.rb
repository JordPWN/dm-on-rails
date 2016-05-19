class Campaign < ActiveRecord::Base
	has_many :games
	has_many :beats

	belongs_to :user

	def self.new_campaign(title, user, beats)
		new_campaign = Campaign.create(
			title: title,
			user_id: user
		)
		beats.each do |new_beat, index|
			saved_beat = Beat.create(
				order: index,
				content: new_beat,
				campaign_id: new_campaign
			)
			new_campaign.beats << saved_beat
		end
	end
end