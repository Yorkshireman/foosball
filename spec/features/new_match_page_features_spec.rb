require 'rails_helper'
include SessionsHelper

feature 'New Match Page' do
	let(:league){ create(:league_with_players, players_count: 4) }
	
	before :each do
		log_in league
		visit new_match_path		
	end

	it "user can create a new match using existing players, creating one Team of one Person (test to be removed)" do
		check("match_team_1_player_ids_" + "#{league.players[0].id}")
		click_on 'Start Match'
		expect(league.matches.count).to eq 1
		expect(league.matches[0].teams[0].players).to include league.players[0]
	end

	it "user can create a new match using existing players, creating new unique Teams of 1 person per team" do
		check("match_team_1_player_ids_" + "#{league.players[0].id}")
		check("match_team_2_player_ids_" + "#{league.players[1].id}")
		click_on 'Start Match'
		expect(league.matches.first.teams.first.players.first).to eq league.players[0]
		expect(league.matches.first.teams.first.players.count).to eq 1
		expect(league.matches.first.teams[1].players.first).to eq league.players[1]
		expect(league.matches.first.teams[1].players.count).to eq 1		
	end

	xit "user can create a new match using existing players, creating new Teams of 2 people per team"

	xit "user can create a new match using existing players, creating one team of 1 person and one team of 2 people"

	xit "user can create new players while creating a match"
	
	xit 'submitting form takes user to match show page'

	xit "can't create a match with only one team"

	def log_in league
		visit login_path
		fill_in 'session[name]', with: "#{league.name}"
		fill_in 'session[password]', with: "#{league.password}"
		click_on 'Log in'
	end
end