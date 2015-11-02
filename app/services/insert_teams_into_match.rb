class InsertTeamsIntoMatch
	def self.call teams, match
		teams.map {|team| match.teams << team}
	end
end