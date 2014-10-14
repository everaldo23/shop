class AddHtmlIdToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :html_id, :string
  end
end
