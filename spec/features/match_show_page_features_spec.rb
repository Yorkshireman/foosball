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
		@match = Match.last
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

	it "form submission updates match scores, match winning_team, and takes you to home page" do
		find('#game_1_score').find(:xpath, 'option[2]').select_option
		find('#game_1_winning_team_id').find(:xpath, 'option[2]').select_option
		find('#game_2_score').find(:xpath, 'option[3]').select_option
		find('#game_2_winning_team_id').find(:xpath, 'option[3]').select_option
		find('#game_3_score').find(:xpath, 'option[2]').select_option
		find('#game_3_winning_team_id').find(:xpath, 'option[2]').select_option
		click_on 'Update'
		expect(Match.last.games[0].winning_score).to eq 6
		expect(Match.last.games[1].winning_score).to eq 7
		expect(Match.last.games[0].winning_score).to eq 6
		expect(Match.last.winning_team_id).to eq Match.last.teams[0].id
		expect(current_path).to eq root_path
		expect(page).to have_content "Match Winner and scores updated. Well done #{WinningTeamNames.call(Match.last)}!"
	end

	it "form submission with one or more blank scores not allowed" do
		find('#game_1_score').find(:xpath, 'option[2]').select_option
		find('#game_1_winning_team_id').find(:xpath, 'option[2]').select_option
		find('#game_2_score').find(:xpath, 'option[3]').select_option
		find('#game_2_winning_team_id').find(:xpath, 'option[3]').select_option
		find('#game_3_winning_team_id').find(:xpath, 'option[2]').select_option
		click_on 'Update'
		expect(Match.last.winning_team_id).to eq nil
		expect(current_path).to eq match_path(Match.last)
		expect(page).to have_content "Cannot save Match with blank scores"
	end

	it "form submission with one or more blank winning team fields not allowed" do
		find('#game_1_score').find(:xpath, 'option[2]').select_option
		find('#game_1_winning_team_id').find(:xpath, 'option[2]').select_option
		find('#game_2_score').find(:xpath, 'option[3]').select_option
		find('#game_3_score').find(:xpath, 'option[2]').select_option
		find('#game_3_winning_team_id').find(:xpath, 'option[2]').select_option
		click_on 'Update'
		expect(Match.last.winning_team_id).to eq nil
		expect(current_path).to eq match_path(Match.last)
		expect(page).to have_content "Ensure you have selected a winning team for every game"
	end


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