require 'rails_helper'

RSpec.describe Match, type: :model do
	it{ should belong_to :league }
	it{ should validate_presence_of :league }

	it{ should have_and_belong_to_many :teams }
	it{ should have_many :games }
end
