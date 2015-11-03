class PlayersController < ApplicationController
	def create
		p "PARAMS:"
		p params
		player = Player.create(name: params[:player][:name], league: current_league)
		current_league.players << player
		render nothing: true
	end
end