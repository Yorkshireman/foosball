class PlayersController < ApplicationController
	def create
		@player = Player.create(name: params[:player][:name], league: current_league)
		@match = Match.new(league: current_league)
		current_league.players << @player
		respond_to do |format|
			format.js	{}
		end
	end
end