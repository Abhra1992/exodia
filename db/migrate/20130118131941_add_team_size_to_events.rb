class AddTeamSizeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :team_size, :integer
  end
end
