class AddSyahrilpicsToProducts < ActiveRecord::Migration
  def change
    add_attachment :products, :syahrilpics
  end
end
