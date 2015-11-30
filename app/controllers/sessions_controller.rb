class SessionsController < ApplicationController
  def new
  end

  def create
  	league = League.find_by(name: params[:session][:name]) 
  	if league && league.authenticate(params[:session][:password])
	  	log_in(league)
	  	redirect_to root_path
	  	flash[:notice] = "You are logged in to #{current_league.name}"
	  else
	  	flash[:alert] = "Invalid League Name/Password combination"
	  	render :new
		end
  end

  def destroy
  	if log_out && current_league == nil
	  	redirect_to root_path
	  	flash[:notice] = "You have logged out. See you next time!"
	  end
  end
end