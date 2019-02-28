class CreateTinyPatterns < ActiveRecord::Migration[5.2]
  def change
    create_table :tiny_patterns do |t|
      t.integer :pattern_no
      t.string :name
      t.string :solution
      t.references :pattern
      t.timestamps
    end
  end
end
