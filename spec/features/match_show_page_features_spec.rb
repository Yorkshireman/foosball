require 'rails_helper'

feature 'Match Show Page' do
	it 'shows three games ready for scoring' do
		# test_league = create(:league_with_players, players_count: 4)
		match = create(:match)
		visit match_path(match)
		expect(page).to have_content "Game 1"
		expect(page).to have_content "Game 2"
		expect(page).to have_content "Game 3"
	end

	xit "has a winner select radio button and a winning-team score input field"
end