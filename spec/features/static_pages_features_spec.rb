require 'rails_helper'

feature 'static_pages' do
	
	context 'when on homepage' do
		before(:each){ visit root_path }

		it "displays 'Create a New Match'" do
			expect(page).to have_content "Create a New Match"
		end

		it "displays 'History and Stats'" do
			expect(page).to have_content "History and Stats"
		end

		it 'create match link goes to new_match path' do
			click_on 'Create a New Match'
			expect(current_path).to eq new_match_path
		end

		xit "has a link to 'Matches in Progess' (unresolved matches)"

	end
end