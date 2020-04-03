class CreateEventAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :event_addresses do |t|
      t.integer :event_id
      t.integer :address_id 
      t.string :category
    end
  end
end
