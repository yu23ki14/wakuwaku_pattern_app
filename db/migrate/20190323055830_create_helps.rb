class CreateHelps < ActiveRecord::Migration[5.2]
  def change
    create_table :helps do |t|
      t.string :title
      t.timestamps
    end
  end
end
