class Product < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 100}
  validates :image_url, presence: true, format: {
    with: %r{\.(gif|png|jpg|jpeg)}i,
    message: "The file must be in a PNG, JPG, JPEG or GIF format"
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
