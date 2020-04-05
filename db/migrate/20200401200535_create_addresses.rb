class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :category
      t.string :street
      t.string :city 
      t.string :state
      t.string :country
      t.integer :event_id
    end
  end
end
