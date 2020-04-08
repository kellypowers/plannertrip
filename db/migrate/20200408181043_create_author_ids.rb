class CreateAuthorIds < ActiveRecord::Migration[6.0]
  def change
    create_table :author_ids do |t|
      t.integer :user_id
    end
  end
end
