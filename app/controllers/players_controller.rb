class PlayersController < ApplicationController
	def create
		@match = Match.new(league: current_league)
		@player = Player.create(name: params[:player][:name], league: current_league)
		current_league.players << @player
		respond_to do |format|
			format.js	{}
		end
	end
end