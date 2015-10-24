require 'rails_helper'

RSpec.describe League, type: :model do
  it{ should have_many :players }
end
