class CreateExcharts < ActiveRecord::Migration[5.1]
  def change
    create_table :excharts do |t|
      t.references :user
      t.jsonb :data
      t.timestamps
    end
  end
end
