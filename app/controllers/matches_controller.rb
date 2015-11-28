class MatchesController < ApplicationController
	def new
		@player = Player.new
		@players = Player.all
		@match = Match.new
	end

	def create
		@match = Match.new(league: current_league)

		if team_1_player_ids && team_2_player_ids
			teams = BuildTeams.call team_1_player_ids, team_2_player_ids, current_league
			InsertTeamsIntoMatch.call teams, @match
			@match.save
			3.times{ @match.games.create }
			redirect_to @match
		else
			flash[:alert] = "Please select players for both teams"
			@player = Player.new
			redirect_to new_match_path
		end
	end

	def show
		@match = Match.find(params[:id])
	end

	
	private

	def team_1_player_ids
		params[:match] && params[:match][:team_1] && params[:match][:team_1][:player_ids]
	end

	def team_2_player_ids
		params[:match] && params[:match][:team_2] && params[:match][:team_2][:player_ids]
	end
end