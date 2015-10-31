require 'rails_helper'
include SessionsHelper

feature 'New Match Page' do

	it "user can create a new match using existing players, creating one Team of one Person (test to be removed)" do
		league = create(:league_with_players, players_count: 4)
		log_in(league)
		visit new_match_path
		select "#{league.players[0].first_name}", from: 'match_teams_player_ids'
		click_on 'Start Match'
		
		expect(league.matches.count).to eq 1
		expect(league.matches.last.teams.count).to eq 1
		expect(league.matches.last.teams.first.players).to include league.players[0]
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

	def log_in league
		visit login_path
		fill_in 'session[name]', with: "#{league.name}"
		fill_in 'session[password]', with: "#{league.password}"
		click_on 'Log in'
	end
end