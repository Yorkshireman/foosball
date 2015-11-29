require 'rails_helper'

feature 'Match Show Page' do
	let(:test_league){ create(:league_with_players, players_count: 4) }

	before :each do
		log_in test_league
		visit new_match_path
		select_player("team_1", test_league.players[0])
		select_player("team_2", test_league.players[2])
		select_player("team_2", test_league.players[3])
		click_on 'Start Match'
	end

	it 'shows three games ready for scoring' do
		expect(page).to have_content "Game 1"
		expect(page).to have_content "Game 2"
		expect(page).to have_content "Game 3"
	end

	it "shows team members" do
		expect(page).to have_content "#{test_league.players[0].name}"
		expect(page).to have_content "#{test_league.players[2].name}"
		expect(page).to have_content "#{test_league.players[3].name}"
	end

	xit "has a winner select radio button and a winning-team score input field"


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