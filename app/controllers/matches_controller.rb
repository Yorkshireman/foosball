class MatchesController < ApplicationController
	def new
		@match = Match.new
	end

	def create
		@match = Match.new(league_id: current_league.id)
		@team = Team.create(league_id: current_league.id)
		
		params[:match][:teams][:player_ids].each do |player_id|
			unless player_id.to_i == 0
				@team.players << Player.find(player_id.to_i)
			end 
		end

		if @match.save
			@match.teams << @team
		end
		
		render nothing: true
	end
end