class CreateDietUserAssignmentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :diet_user_assignments_tables do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
