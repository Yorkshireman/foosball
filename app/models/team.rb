class Team < ActiveRecord::Base
	belongs_to :league
	has_and_belongs_to_many :players
	has_and_belongs_to_many :matches
	validates :league, presence: true
end
