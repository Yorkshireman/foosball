class SessionsController < ApplicationController
  def new
  end

  def create
  	league = League.find_by(name: params[:session][:name])
  	log_in(league)
  	redirect_to root_path
  	flash[:notice] = "You are logged in to #{current_league.name}"
  end
end