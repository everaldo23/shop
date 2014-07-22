class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :status, presence: true
  
  def total
    order_items.map do |i| i.subtotal end.sum
  end
    
end
