class AddComponentsToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :components, :string
  end
end
