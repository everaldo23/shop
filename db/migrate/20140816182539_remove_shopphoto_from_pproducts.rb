class RemoveShopphotoFromPproducts < ActiveRecord::Migration
  def change
    remove_attachment :products, :shopphoto
  end
end
