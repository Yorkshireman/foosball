class ScoreMatch
	def initialize match, params
		@match = match
		@params = params
	end

	def call
		@match.games[0].update_attributes(winning_score: @params[:game_1_score].to_i)
		@match.games[1].update_attributes(winning_score: @params[:game_2_score].to_i)
		@match.games[2].update_attributes(winning_score: @params[:game_3_score].to_i)
		@match.update_attributes(winning_team_id: winning_team_id(@params))
	end

	def winning_team_id(params)
		winning_teams_ids = [params[:game_1_winning_team_id].to_i, params[:game_2_winning_team_id].to_i, params[:game_3_winning_team_id].to_i]
		
		winning_teams_ids.each do |x|
			id_index = winning_teams_ids.index(x)
			id = winning_teams_ids.slice!(id_index)
			return id if winning_teams_ids.any? { |y| y == id }
		end
	end
end