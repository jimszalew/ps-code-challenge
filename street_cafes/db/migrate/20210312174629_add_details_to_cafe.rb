class AddDetailsToCafe < ActiveRecord::Migration[5.1]
  def change
    add_column :cafes, :name, :string
    add_column :cafes, :address, :string
    add_column :cafes, :post_code, :string
    add_column :cafes, :chairs, :integer
    add_column :cafes, :info, :string
  end
end
