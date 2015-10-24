require 'rails_helper'

feature 'Leagues' do
	describe 'New League Page' do
		it 'user can create a new League with league name and password' do
			visit new_league_path
			fill_in 'name', with: 'My First League'
			fill_in 'password', with: 'passwordpassword'
			fill_in 'password_confirmation', with: 'passwordpassword'
			click_on 'Create'
			expect{ League.count }.to have_changed.by 1
			expect(League.last.name).to eq 'My First League'
			expect(current_path).to eq root_path
			expect(page).to have_content 'League has been successfully created'
		end
	end
end