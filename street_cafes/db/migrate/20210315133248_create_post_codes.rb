class CreatePostCodes < ActiveRecord::Migration[5.1]
  def change
    create_view :post_codes
  end
end
