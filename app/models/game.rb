class Game < ActiveRecord::Base
	belongs_to :campaign
	belongs_to :user
	belongs_to :beat
end