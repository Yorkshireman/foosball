class PlayersController < ApplicationController
	def create
		@dog = Player.create(name: params[:player][:name], league: current_league)
		current_league.players << @dog
		respond_to do |format|
			format.js	{}
		end
	end
end