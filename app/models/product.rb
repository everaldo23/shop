class Product < ActiveRecord::Base
  has_many :order_items
  belongs_to :brand
  validates :brand_id, presence: true
  validates :category, presence: true
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 200}
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :stock, numericality: { greater_than_or_equal_to: 0}
  has_attached_file :syahrilpics,
  :storage => :s3, :bucket => 'syahrilpics2', styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300#',
      }
  #Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :syahrilpics, :content_type => /\Aimage\/.*\Z/
  validates :syahrilpics, :attachment_presence => true
end
