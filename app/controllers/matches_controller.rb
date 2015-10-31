class MatchesController < ApplicationController
	def new
		@match = Match.new
	end

	def create
  	p "SESSION ID:"
  	p session[:league_id]
	  p "CURRENT_LEAGUE:"
	  p current_league
		@match = Match.new(league_id: current_league.id)
		@team = Team.create(league_id: current_league.id)
		@team.players << Player.find(params["match"]["teams"]["player_ids"].to_i)

		if @match.save
			@match.teams << @team
		end
		
		render nothing: true
	end
end