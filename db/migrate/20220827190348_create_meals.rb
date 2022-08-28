class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :title
      t.integer :calories
      t.jsonb :nutrients
      t.datetime :eat_time

      t.timestamps
    end
  end
end
