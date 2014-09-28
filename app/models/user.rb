class User < ActiveRecord::Base
  has_many :favourites
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_uniqueness_of :username, :email
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
end
