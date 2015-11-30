require 'rails_helper'

describe SessionsHelper do
	describe '#log_in' do
		it 'places the league in the session' do
			league = create(:league)
			log_in(league)
			expect(session[:league_id]).to eq league.id
		end
	end
end