require 'rails_helper'

RSpec.describe Game, type: :model do
  it{ should belong_to :match }
  it{ should validate_presence_of :match }
end
