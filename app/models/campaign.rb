class Campaign < ActiveRecord::Base
	has_many :games, dependent: :destroy 
	has_many :beats, dependent: :destroy 

	belongs_to :user

  # validates :title, presence: true 
  # validates :description, presence: true 



end 

