require 'rails_helper'

feature 'New Match Page' do

	before :each do
		visit new_match_path
	end

	it "user can create a new match using existing players, but currently no Teams" do
		league = create(:league_with_players, players_count: 4)
		# select "#{league.players[0].id}", from: 'player[player_id]'
		# select "#{league.players[1].id}", from: 'player[player_id]'

		# select two player from Team 1 dropdown, and two players from Team 2 dropdown.
		click_on 'Start Match'
		expect{ Match.count }.to have_changed.by 1
		expect{ Team.count }.to have_changed.by 2
		expect{ Match.last.teams.count }.to have_changed.by 2
		expect{ Player.count }.to have_changed.by 0
		expect(Match.last.teams.first.players).to include league.players[0]
		expect(Match.last.teams.first.players).to include league.players[1]
		expect(Match.last.teams.last.players).to  include league.players[2]
		expect(Match.last.teams.last.players).to  include league.players[3]
		expect(page).to have_content "Let the games begin!"
	end
	
	xit "user can create new players"

	xit 'submitting form takes user to match show page'
end