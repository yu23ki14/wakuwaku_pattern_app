class CreatePatterns < ActiveRecord::Migration[5.1]
  def change
    create_table :patterns do |t|
      t.integer :pattern_index
      t.string :pattern_id
      t.string :pattern_name
      t.string :summary
      t.text :context
      t.string :b_problem
      t.text :problem
      t.string :b_solution
      t.text :solution
      t.text :consequence
      t.integer :unit_no
      t.references :category
      t.references :pattern_group

      t.timestamps
    end
  end
end
