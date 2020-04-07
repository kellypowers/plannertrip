class CreatePlanners < ActiveRecord::Migration[6.0]
  def change
    create_table :planners do |t|
      t.datetime :date_and_time 
      t.integer :event_id
      t.integer :user_id
    end
  end
end
