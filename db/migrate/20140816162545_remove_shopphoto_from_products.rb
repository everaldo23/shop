class RemoveShopphotoFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :shopphoto
  end
end
