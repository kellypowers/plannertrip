class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name 
      t.string :category
      t.string :description
      t.string :street
      t.string :city 
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.datetime :start_date_time
      t.datetime :end_date_time

      
      
    end
  end
end
