class MatchesController < ApplicationController
	def new
		@match = Match.new
	end

	def create
		@match = Match.new(league: current_league)

		if team_1_player_ids && team_2_player_ids
			teams = BuildTeams.call team_1_player_ids, team_2_player_ids, current_league
			teams.map {|team| @match.teams << team}
			@match.save
			render nothing: true
		else
			flash[:alert] = "Please select players for both teams"
			render :new
		end
	end

	
	private

	def team_1_player_ids
		params[:match][:team_1][:player_ids] if params[:match] && params[:match][:team_1] && params[:match][:team_1][:player_ids]
	end

	def team_2_player_ids
		params[:match][:team_2][:player_ids] if params[:match] && params[:match][:team_2] && params[:match][:team_2][:player_ids]	
	end
end