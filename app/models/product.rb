class Product < ActiveRecord::Base
  validates :category, presence: true
  validates :brand, presence: true
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 200}
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  has_attached_file :shopphoto,
  :storage => :s3, :bucket => 'shopphoto', styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300#'
    }
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :shopphoto, :content_type => /\Aimage\/.*\Z/
  validates :shopphoto, :attachment_presence => true
end
