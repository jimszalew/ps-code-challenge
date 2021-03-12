class AddCategoryToCafe < ActiveRecord::Migration[5.1]
  def change
    add_column :cafes, :category, :varchar
  end
end
