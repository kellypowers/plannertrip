class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id 
      t.integer :event_id 
      t.integer :rating 
      t.string :comment

      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
