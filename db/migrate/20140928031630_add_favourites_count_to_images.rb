class AddFavouritesCountToImages < ActiveRecord::Migration
  def change
    add_column :images, :favourites_count, :integer, default: 0
  end
end
