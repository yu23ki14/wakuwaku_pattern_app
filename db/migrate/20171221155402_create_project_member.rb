class CreateProjectMember < ActiveRecord::Migration[5.1]
  def change
    create_table :project_members do |t|
      t.references :user,  index: true, foreign_key: true
      t.references :project,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
