class Campaign < ActiveRecord::Base
	has_many :games
	has_many :beats

	belongs_to :user

  # validates :title, presence: true 
  # validates :description, presence: true 



end 

