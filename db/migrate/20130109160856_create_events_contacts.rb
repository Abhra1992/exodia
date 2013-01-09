class CreateEventsContacts < ActiveRecord::Migration
  def change
    create_table :events_contacts do |t|
      t.references :event
      t.references :contact
      
      t.timestamps
    end
    add_index :events_contacts, :event_id
    add_index :events_contacts, :contact_id
  end
end
