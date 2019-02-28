class AddColumnIndexToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :category_id, :string
  end
end
