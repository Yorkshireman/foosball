require 'rails_helper'

feature 'New Match Page' do

	before{ @league = create(:league_with_players, players_count: 4) }
	
	before(:each){ visit new_match_path }

	it "user can create a new match using existing players" do
		p League.last.players
		select "#{@league.players[0].id}", from: 'player_id'
		select "#{@league.players[1].id}", from: 'player_id'
		click_on 'Start Match'
		expect{ Match.count }.to have_changed.by 1
		expect(Match.last.players).to include @league.players[0]
		expect(Match.last.players).to include @league.players[1]
	end
	
	xit "user can create new players"

	xit 'submitting form takes user to match show page'
end