class AddScoreColumnToGames < ActiveRecord::Migration
  def change
  	add_column :games, :winning_score, :integer
  end
end
