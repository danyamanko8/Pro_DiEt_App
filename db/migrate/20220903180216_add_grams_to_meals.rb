class AddGramsToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :grams, :float
  end
end
