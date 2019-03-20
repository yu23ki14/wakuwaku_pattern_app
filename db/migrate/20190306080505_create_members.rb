class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :member_id
      t.string :hashed_id
      t.timestamps
    end
  end
end
