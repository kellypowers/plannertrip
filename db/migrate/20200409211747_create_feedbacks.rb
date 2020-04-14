class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :content
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :event
      t.timestamps :created_at
    end
  end
end
