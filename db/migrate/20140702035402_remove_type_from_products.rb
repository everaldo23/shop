class RemoveTypeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :type, :string
    add_column :products, :category, :string
  end
end
