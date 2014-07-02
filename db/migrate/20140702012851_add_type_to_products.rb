class AddTypeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :type, :string
    remove_column :products, :image_url, :string
  end
end
