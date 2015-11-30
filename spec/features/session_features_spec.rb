require 'rails_helper'

feature 'Sessions' do
	let(:league) { create :league }

	it 'can create a new league' do
		visit new_league_path
		fill_in 'league[name]', with: "Test League"
		fill_in 'league[password]', with: "passwordpassword"
		fill_in 'league[password_confirmation]', with: "passwordpassword"
		click_on 'Create League'
		expect(League.count).to eq 1
		expect(League.last.name).to eq "Test League"
		expect(page).to have_content "League successfully created. Start a Match!"
	end

	describe 'Logging in' do
		before(:each){ visit login_path }

		it 'can login to a League' do
			fill_in 'session[name]', with: "#{league.name}"
			fill_in 'session[password]', with: "#{league.password}"
			click_on 'Log in'
			expect(current_path).to eq root_path
			expect(page).to have_content "You are logged in to #{league.name}"
		end

		it 'cannot login with incorrect league name' do
			fill_in 'session[name]', with: "Invalid League Name"
			fill_in 'session[password]', with: "#{league.password}"
			click_on 'Log in'
			expect(current_path).to eq login_path
			expect(page).to have_content 'Invalid League Name/Password combination'
		end

		it 'cannot login with incorrect league password' do
			fill_in 'session[name]', with: "#{league.name}"
			fill_in 'session[password]', with: "invalid_password"
			click_on 'Log in'
			expect(current_path).to eq login_path
			expect(page).to have_content 'Invalid League Name/Password combination'
		end
	end

	describe 'Logging out' do
		it 'can logout' do
			visit login_path
			fill_in 'session[name]', with: "#{league.name}"
			fill_in 'session[password]', with: "#{league.password}"
			click_on 'Log in'
			click_on 'Logout'
			expect(current_path).to eq root_path
			expect(page).to have_content "You have logged out. See you next time!"
		end

		it 'user is presented with a notice if they try to logout whilst already logged out' do
			visit root_path
			click_on 'Logout'
			expect(current_path).to eq root_path
			expect(page).to have_content "You are already logged out!"
		end
	end
end