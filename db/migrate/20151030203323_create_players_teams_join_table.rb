class CreatePlayersTeamsJoinTable < ActiveRecord::Migration
  def change
  	create_table :players_teams, id: false do |t|
      t.integer :player_id
      t.integer :team_id
    end
 
    add_index :players_teams, :player_id
    add_index :players_teams, :team_id
  end
end
