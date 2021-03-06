require 'rails_helper'

feature 'New Match Features' do

	let(:test_league){ create(:league_with_players, players_count: 4) }

	before :each do
		log_in test_league
		visit new_match_path
	end

	it 'user is redirected to login page if they try to navigate to new_match page' do
		visit root_path
		click_on 'Logout'
		click_on 'Create a New Match'
		expect(current_path).to eq login_path
		expect(page).to have_content "You must login or create a new league before continuing"
	end

	it "user can create a new match using existing players, creating new unique Teams of 1 person per team" do
		select_player("team_1", test_league.players[0])
		select_player("team_2", test_league.players[1])
		click_on 'Start Match'

		expect(test_league.matches.first.teams[0].players).to eq [test_league.players[0]]
		expect(test_league.matches.first.teams[1].players).to eq [test_league.players[1]]
	end

	it "when a user creates a match, three games are created within it" do
		select_player("team_1", test_league.players[0])
		select_player("team_2", test_league.players[1])
		click_on 'Start Match'
		expect(Match.last.games.count).to eq 3
	end

	it "user can create a new match using existing players, creating new Teams of 2 people per team" do
		select_player("team_1", test_league.players[0])
		select_player("team_1", test_league.players[1])
		select_player("team_2", test_league.players[2])
		select_player("team_2", test_league.players[3])
		click_on 'Start Match'

		expect(test_league.matches.first.teams[0].players).to eq [test_league.players[0], test_league.players[1]]
		expect(test_league.matches.first.teams[1].players).to eq [test_league.players[2], test_league.players[3]]
	end

	it "user can create a new match using existing players, creating one team of 1 person and one team of 2 people" do
		select_player("team_1", test_league.players[0])
		select_player("team_2", test_league.players[2])
		select_player("team_2", test_league.players[3])
		click_on 'Start Match'

		expect(test_league.matches.first.teams[0].players).to eq [test_league.players[0]]
		expect(test_league.matches.first.teams[1].players).to eq [test_league.players[2], test_league.players[3]]
	end

	it "can't create a match with only one team" do
		select_player("team_1", test_league.players[0])
		click_on 'Start Match'
		expect(Match.count).to eq 0
		expect(page).to have_content("Please select players for both teams")
		expect(current_path).to eq new_match_path
	end

	it "can't create a match with no teams/players" do
		click_on 'Start Match'
		expect(Match.count).to eq 0
		expect(page).to have_content("Please select players for both teams")
		expect(current_path).to eq new_match_path
	end

	it "user can create new players while creating a match", js: true do
		fill_in 'player[name]', with: "Test Player"
		click_on 'Create Player'
		expect(page).to have_css('label', text: "Test Player")
		expect(page).to have_selector('input', count: 13)
	end


	xit 'test for incorrect player submissions, edge cases, maybe sanitize player params'
	
	it 'submitting form takes user to match show page' do
		select_player("team_1", test_league.players[0])
		select_player("team_2", test_league.players[3])
		click_on 'Start Match'
		match = Match.last
		expect(current_path).to eq match_path(match)
		expect(page).to have_content "Let the games begin!"	
	end

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