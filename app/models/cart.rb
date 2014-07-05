class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :users, dependent: :destroy
end