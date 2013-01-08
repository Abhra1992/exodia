class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :phone
      t.string :firstname
      t.string :lastname
      t.string :position

      t.timestamps
    end
  end
end
