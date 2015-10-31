require 'rails_helper'

feature 'Sessions' do
	describe 'Logging in' do
		it 'can login to a League' do
			league = create :league
			visit login_path
			expect(page).to have_content 'League Login'
			fill_in 'session[name]', with: "#{league.name}"
			fill_in 'session[password]', with: "#{league.password}"
			click_on 'Log in'

			expect(current_path).to eq root_path
			expect(page).to have_content "You are logged in to #{league.name}"
		end

		it 'cannot login with incorrect league name' do
			league = create :league
			visit login_path
			fill_in 'session[name]', with: "Invalid League Name"
			fill_in 'session[password]', with: "#{league.password}"
			click_on 'Log in'
			expect(current_path).to eq login_path
			expect(page).to have_content 'Invalid League Name/Password combination'
		end

		it 'cannot login with incorrect league password' do
			league = create :league
			visit login_path
			fill_in 'session[name]', with: "#{league.name}"
			fill_in 'session[password]', with: "invalid_password"
			click_on 'Log in'
			expect(current_path).to eq login_path
			expect(page).to have_content 'Invalid League Name/Password combination'
		end
	end
end