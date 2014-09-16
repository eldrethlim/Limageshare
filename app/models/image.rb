class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :description, presence: true
end
