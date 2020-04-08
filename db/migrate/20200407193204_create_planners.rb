class CreatePlanners < ActiveRecord::Migration[6.0]
  def change
    create_table :planners do |t|
      t.string :name
       
      
      t.integer :user_id
    end
  end
end
