class Image < ActiveRecord::Base
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :description, presence: true
end
