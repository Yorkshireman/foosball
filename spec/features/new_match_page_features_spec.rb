require 'rails_helper'
include SessionsHelper

feature 'New Match Page' do
	let(:test_league){ create(:league_with_players, players_count: 4) }

	it "user can create a new match using existing players, creating new unique Teams of 1 person per team" do
		log_in test_league
		visit new_match_path
		select_player("team_1", test_league.players[0])
		select_player("team_2", test_league.players[1])
		click_on 'Start Match'

		expect(test_league.matches.first.teams[0].players).to eq [test_league.players[0]]
		expect(test_league.matches.first.teams[1].players).to eq [test_league.players[1]]
	end

	it "user can create a new match using existing players, creating new Teams of 2 people per team" do
		log_in test_league
		visit new_match_path
		select_player("team_1", test_league.players[0])
		select_player("team_1", test_league.players[1])
		select_player("team_2", test_league.players[2])
		select_player("team_2", test_league.players[3])
		click_on 'Start Match'
		
		expect(test_league.matches.first.teams[0].players).to eq [test_league.players[0], test_league.players[1]]
		expect(test_league.matches.first.teams[1].players).to eq [test_league.players[2], test_league.players[3]]
	end

	xit "user can create a new match using existing players, creating one team of 1 person and one team of 2 people"

	xit "user can create new players while creating a match"
	
	xit 'submitting form takes user to match show page'

	xit "can't create a match with only one team"

	xit "error handling for empty submissions and edge cases"


	private

	def log_in(league)
		visit login_path
		fill_in 'session[name]', with: "#{league.name}"
		fill_in 'session[password]', with: "#{league.password}"
		click_on 'Log in'
	end

	def select_player(team, player)
		player_index = player.league.players.index(player) 
		check("match_" + team + "_player_ids_" + "#{test_league.players[player_index].id}")
	end
end