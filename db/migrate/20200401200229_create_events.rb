class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name 
      t.string :category
      t.string :description
      t.boolean :already_vistied
      
    end
  end
end
