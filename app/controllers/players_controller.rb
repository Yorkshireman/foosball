class PlayersController < ApplicationController
	def create
		player = Player.create(name: params[:player][:name], league: current_league)
		current_league.players << player
		render nothing: true
	end
end