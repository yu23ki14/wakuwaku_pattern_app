class CreatePatternGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :pattern_groups do |t|
      t.references :category
      t.string :name
      t.timestamps
    end
  end
end
