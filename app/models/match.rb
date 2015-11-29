class Match < ActiveRecord::Base
	belongs_to :league
	has_and_belongs_to_many :teams
	has_many :games
	validates :league, presence: true
end
