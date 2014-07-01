class AddShopphotoToProducts < ActiveRecord::Migration
  def self.up
    add_attachment :products, :shopphoto
  end
  
  def self.down
    remove_attachment :products, :shopphoto
  end
end
