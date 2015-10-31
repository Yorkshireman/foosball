class Player < ActiveRecord::Base
  belongs_to :league
  validates :league, presence: true

  has_and_belongs_to_many :teams

  def name_with_initial
  	"#{first_name} #{last_name.first}"
  end
end
