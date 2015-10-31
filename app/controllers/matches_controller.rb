class MatchesController < ApplicationController
	def new
		@match = Match.new
	end

	def create
		match = Match.new(league: current_league)
		team1 = Team.create(league: current_league)
		team2 = Team.create(league: current_league)
		
		params[:match][:team_1][:player_ids].each do |player_id|
			unless player_id.to_i == 0
				team1.players << Player.find(player_id.to_i)
			end 
		end

		params[:match][:team_2][:player_ids].each do |player_id|
			unless player_id.to_i == 0
				team2.players << Player.find(player_id.to_i)
			end
		end

		if match.save
			match.teams << team1
			match.teams << team2
		end
		
		render nothing: true
	end
end