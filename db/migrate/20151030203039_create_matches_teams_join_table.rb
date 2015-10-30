class CreateMatchesTeamsJoinTable < ActiveRecord::Migration
  def change
  	create_table :matches_teams, id: false do |t|
      t.integer :match_id
      t.integer :team_id
    end
 
    add_index :matches_teams, :match_id
    add_index :matches_teams, :team_id
  end
end
