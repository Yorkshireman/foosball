class Team < ActiveRecord::Base
	belongs_to :league
	validates :league, presence: true

	has_and_belongs_to_many :players
	has_and_belongs_to_many :matches
end