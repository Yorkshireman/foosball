module SessionsHelper
	def current_league
		@current_league ||= League.find_by(id: session[:league_id])
	end
end