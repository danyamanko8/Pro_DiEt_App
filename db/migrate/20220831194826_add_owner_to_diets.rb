class AddOwnerToDiets < ActiveRecord::Migration[7.0]
  def change
    add_column :diets, :owner_id, :integer
  end
end
