require 'rails_helper'

feature 'Home Page' do
	before(:each){ visit root_path }

	it 'can go to new league page' do
		click_on 'Create a New League'
		expect(current_path).to eq new_league_path
	end

	it 'can go to login page' do
		click_on 'League Login'
		expect(current_path).to eq login_path
	end

	it "displays 'Create a New Match'" do
		expect(page).to have_content "Create a New Match"
	end

	it "displays 'History and Stats'" do
		expect(page).to have_content "History and Stats"
	end

	it 'create match link goes to new_match path' do
		allow_any_instance_of(ApplicationController).to receive(:current_league).and_return true
		click_on 'Create a New Match'
		expect(current_path).to eq new_match_path
	end

	xit "has a link to 'Matches in Progess' (unresolved matches)"
end