require 'faker'

FactoryGirl.define do
  factory :league do
    name Faker::Company.name
    password "passwordpassword"
    password_confirmation "passwordpassword"

    factory :league_with_players do
    	transient do
    		players_count 4
    	end

    	after(:create) do |league, evaluator|
    		create_list(:player, evaluator.players_count, league: league)
    	end
    end
  end

end
