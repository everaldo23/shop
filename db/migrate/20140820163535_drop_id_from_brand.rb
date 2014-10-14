class DropIdFromBrand < ActiveRecord::Migration
  def change
    remove_column :brands, :product_id, :integer
  end
end
