class Player < ActiveRecord::Base
  belongs_to :league
  has_and_belongs_to_many :teams
  validates :league, presence: true
end
