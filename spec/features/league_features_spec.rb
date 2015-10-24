require 'rails_helper'

feature 'Leagues' do
	describe 'New League Page' do
		it 'user can create a new League with league name and password' do
			visit new_league_path
			fill_in 'league[name]', with: 'My First League'
			fill_in 'league[password]', with: 'passwordpassword'
			fill_in 'league[password_confirmation]', with: 'passwordpassword'
			
			expect{ click_on 'Create League' }.to change{ League.count }.by(1)
			expect(League.last.name).to eq 'My First League'
			expect(current_path).to eq root_path
			expect(page).to have_content 'League has been successfully created'
		end
	end
end