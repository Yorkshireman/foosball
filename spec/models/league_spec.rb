require 'rails_helper'

RSpec.describe League, type: :model do
  it{ should have_many :players }
  it{ should have_many :teams }
  it{ should have_many :matches }
end
