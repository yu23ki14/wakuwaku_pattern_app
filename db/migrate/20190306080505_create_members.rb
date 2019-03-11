class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :member_id
      t.integer :hashed_id
      t.timestamps
    end
  end
end
