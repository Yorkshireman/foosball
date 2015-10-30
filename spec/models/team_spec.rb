require 'rails_helper'

RSpec.describe Team, type: :model do
  it{ should belong_to :league }
  it{ should validate_presence_of :league }

  it{ should have_and_belong_to_many :players }
  it{ should have_and_belong_to_many :matches }
end
