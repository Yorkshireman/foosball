class LeaguesController < ApplicationController
	def new
		@league = League.new
	end

	def create
	  @league = League.new(league_params)
	  if @league.save
	  	redirect_to root_path
	  	flash[:notice] = 'League successfully created. Start a Match!'
	  end
	end

	
	private

	def league_params
		params.require(:league).permit(:name, :password, :password_confirmation)
	end
end