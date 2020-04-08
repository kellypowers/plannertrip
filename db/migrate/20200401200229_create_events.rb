class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name 
      t.string :category
      t.string :comment
      t.string :street
      t.string :city 
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :address
  

      
      
    end
  end
end
