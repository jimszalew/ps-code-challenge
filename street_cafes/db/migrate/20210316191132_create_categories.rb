class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_view :categories
  end
end
