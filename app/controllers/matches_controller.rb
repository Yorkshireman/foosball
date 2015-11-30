class MatchesController < ApplicationController
	def new
		if current_league == nil
			redirect_to login_path
			flash[:alert] = "You must login or create a new league before continuing"
		else
			@player = Player.new
			@players = Player.all
			@match = Match.new
		end
	end

	def create
		@match = Match.new(league: current_league)

		if team_1_player_ids && team_2_player_ids
			teams = BuildTeams.call team_1_player_ids, team_2_player_ids, current_league
			InsertTeamsIntoMatch.call teams, @match
			@match.save
			3.times{ @match.games.create }
			redirect_to @match
			flash[:notice] = "Let the games begin!"
		else
			flash[:alert] = "Please select players for both teams"
			@player = Player.new
			redirect_to new_match_path
		end
	end

	def show
		@match = Match.find(params[:id])
	end

	def update
		@match = Match.find(params[:id])
		if any_blank_scores?(params)
			flash[:alert] = "Cannot save Match with blank scores"
			render :show
		elsif any_blank_winning_teams?(params)
			flash[:alert] = "Ensure you have selected a winning team for every game"
			render :show
		else
			ScoreMatch.new(@match, params).call
			redirect_to root_path
			flash[:notice] = "Match Winner and scores updated. Well done #{WinningTeamNames.call(@match)}!"
		end
	end

	
	private

	def any_blank_scores? params
		params[:game_1_score] == "" || params[:game_2_score] == "" || params[:game_3_score] == ""
	end

	def any_blank_winning_teams? params
		params[:game_1_winning_team_id] == "" || params[:game_2_winning_team_id] == "" || params[:game_3_winning_team_id] == ""
	end

	def team_1_player_ids
		params[:match] && params[:match][:team_1] && params[:match][:team_1][:player_ids]
	end

	def team_2_player_ids
		params[:match] && params[:match][:team_2] && params[:match][:team_2][:player_ids]
	end
end