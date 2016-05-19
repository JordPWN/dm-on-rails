class Game < ActiveRecord::Base
	belongs_to :campaign
	belongs_to :user
	has_one :beat
end