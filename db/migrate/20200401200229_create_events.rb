class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name 
      t.string :category
      t.string :description
      t.integer :user_id
      
      
    end
  end
end
