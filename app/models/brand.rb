class Brand < ActiveRecord::Base
  has_many :products
  validates_presence_of :name, :html_id
end
