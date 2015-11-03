require 'faker'

FactoryGirl.define do

  factory :player do
    name { Faker::Name.first_name }
	league
  end
  
end
