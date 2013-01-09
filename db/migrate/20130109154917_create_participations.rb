class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :user
      t.references :event
      t.boolean :active, :default => true
      t.integer :level, :default => 0
      t.integer :score, :default => 0
      t.references :team

      t.timestamps
    end
    add_index :participations, :user_id
    add_index :participations, :event_id
    add_index :participations, :team_id
  end
end
