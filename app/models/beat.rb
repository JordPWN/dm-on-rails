class Beat < ActiveRecord::Base
	belongs_to :campaign
	# belongs_to :game
  has_many :games

  # validates presence: true
end