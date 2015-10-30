require 'rails_helper'

RSpec.describe Player, type: :model do
  it{ should belong_to :league }
  
  it{ should validate_presence_of :league }

  it{ should have_and_belong_to_many :teams}

  xit 'cannot be created without a first name'
end
