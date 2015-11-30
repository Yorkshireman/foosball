require 'rails_helper'

describe SessionsHelper do
	let(:league){ create :league }

	describe '#log_in' do
		it 'places the league in the session' do
			log_in(league)
			expect(session[:league_id]).to eq league.id
		end
	end

	describe '#log_out' do
		it 'removes a league from the session' do
			log_in(league)
			log_out
			expect(session[:league_id]).to eq nil
		end
	end
end