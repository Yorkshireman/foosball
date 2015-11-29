module MatchShowPageHelper
	def match_teams(match)
		team1 = match.teams[0]
		team2 = match.teams[1]
		teams_select_array = [[player_names(team1), team1.id], [player_names(team2), team2.id]]
		teams_select_array
	end


	private

	def player_names(team)
		names = []
		team.players.map{ |player| names << player.name }

		if names.count == 1
			return names[0]
		elsif names.count == 2
			"#{names[0]} & #{names[1]}"
		end
	end

end