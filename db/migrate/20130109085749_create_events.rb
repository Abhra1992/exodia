class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :code
      t.text :description
      t.text :rules
      t.text :judging
      t.datetime :start
      t.datetime :end
      t.string :submit_to
      t.boolean :team
      t.integer :rounds
      t.references :venue
      t.references :type

      t.timestamps
    end
    add_index :events, :venue_id
    add_index :events, :type_id
  end
end
