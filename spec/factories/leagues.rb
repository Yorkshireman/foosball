require 'faker'

FactoryGirl.define do
  factory :league do
    name Faker::Company.name
    password_digest Faker::Lorem.characters(10)

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
