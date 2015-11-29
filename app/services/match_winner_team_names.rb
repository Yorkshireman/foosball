class MatchWinnerTeamNames
	def self.call match
		names = ""
		winning_team = Team.find(match.winning_team_id)
		
		if winning_team.players.count == 1
			names << winning_team.players[0].name
		else
			names << winning_team.players[0].name
			names << " & "
			names << winning_team.players[1].name
		end
	end
end