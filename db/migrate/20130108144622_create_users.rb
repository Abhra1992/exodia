class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :phone
      t.date :birthdate
      t.string :school
      t.string :firstname
      t.string :lastname
      t.string :username

      t.timestamps
    end
  end
end
