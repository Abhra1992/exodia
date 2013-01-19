class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.references :event
      t.references :creator
      t.integer :size, :default => 1

      t.timestamps
    end
    add_index :teams, :event_id
    add_index :teams, :creator_id
  end
end
