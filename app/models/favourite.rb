class Favourite < ActiveRecord::Base
  belongs_to :image, counter_cache: true
  belongs_to :user
end
