class Campaign < ActiveRecord::Base
	has_many :games
	has_many :beats
end