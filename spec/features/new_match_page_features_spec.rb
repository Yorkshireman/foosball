require 'rails_helper'

feature 'New Match Page' do

	it "user can create a new match using existing players, creating one Team of one Person (test to be removed)" do
		league = create(:league_with_players, players_count: 4)
		visit new_match_path

		# select one player from Team 1 dropdown:
		select "#{league.players[0].first_name}", from: 'match_teams_player_ids'

		expect{ click_on 'Start Match' }.to change{ [Match.all.count, Team.all.count, Match.last.teams.count, Player.count] }.by([1, 1, 1, 0])
		

		# click_on 'Start Match'
		# expect{ Match.count }.to have_changed by 1
		# expect{ Team.count }.to have_changed by 1
		# expect{ Match.last.teams.count }.to have_changed by 1
		# expect{ Player.count }.to have_changed by 0
		expect(Match.last.teams.first.players).to include league.players[0]
	end

	xit "user can create a new match using existing players, creating new Teams of 1 person per team"
		# click_on 'Start Match'
		# expect{ Match.count }.to have_changed.by 1
		# expect{ Team.count }.to have_changed.by 2
		# expect{ Match.last.teams.count }.to have_changed.by 2
		# expect{ Player.count }.to have_changed.by 0
		# expect(Match.last.teams.first.players).to include league.players[0]
		# expect(Match.last.teams.first.players).to include league.players[1]
		# expect(Match.last.teams.last.players).to  include league.players[2]
		# expect(Match.last.teams.last.players).to  include league.players[3]
		# expect(page).to have_content "Let the games begin!"

	xit "user can create a new match using existing players, creating new Teams of 2 people per team"

	xit "user can create a new match using existing players, creating one team of 1 person and one team of 2 people"

	xit "user can create new players while creating a match"
	
	xit 'submitting form takes user to match show page'
end