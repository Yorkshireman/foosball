class BuildTeams	
	def self.call team_1_player_ids, team_2_player_ids, current_league
		team1 = Team.create(league: current_league)
		team2 = Team.create(league: current_league)
		
		team_1_player_ids.each do |player_id|
			team1.players << Player.find(player_id)
		end

		team_2_player_ids.each do |player_id|
			team2.players << Player.find(player_id)
		end

		[team1, team2]
	end
end