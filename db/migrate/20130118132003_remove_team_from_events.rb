class RemoveTeamFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :team
  end

  def down
    add_column :events, :team, :boolean
  end
end
