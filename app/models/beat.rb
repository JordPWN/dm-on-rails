class Beat < ActiveRecord::Base
	belongs_to :campaign
	belongs_to :game

  # validates presence: true
end