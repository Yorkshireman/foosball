class MatchesController < ActionController::Base
	def new
		@match = Match.new
	end
end