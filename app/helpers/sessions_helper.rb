module SessionsHelper
	def log_in(league)
		session[:league_id] = league.id
	end

	def current_league
		@current_league ||= League.find_by(id: session[:league_id])
	end
end