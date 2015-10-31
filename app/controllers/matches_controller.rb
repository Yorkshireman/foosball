class MatchesController < ApplicationController
	def new
		@match = Match.new
	end

	def create
		match = Match.new(league: current_league)
		team1 = Team.create(league: current_league)
		team2 = Team.create(league: current_league)
		
		team_1_player_ids.each do |player_id|
			team1.players << Player.find(player_id)
		end

		team_2_player_ids.each do |player_id|
			team2.players << Player.find(player_id)
		end

		if match.save
			match.teams << team1
			match.teams << team2
		end
		
		render nothing: true
	end

	
	private

	def team_1_player_ids
		params[:match][:team_1][:player_ids] if params[:match] && params[:match][:team_1] && params[:match][:team_1][:player_ids]
	end

	def team_2_player_ids
		params[:match][:team_2][:player_ids] if params[:match] && params[:match][:team_2] && params[:match][:team_2][:player_ids]	
	end
end