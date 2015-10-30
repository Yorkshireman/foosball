class League < ActiveRecord::Base
	has_many :players
	has_many :teams
	has_many :matches

	has_secure_password
end
