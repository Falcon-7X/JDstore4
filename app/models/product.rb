class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  self.per_page = 20

  has_many :photos
  accepts_nested_attributes_for :photos
end
