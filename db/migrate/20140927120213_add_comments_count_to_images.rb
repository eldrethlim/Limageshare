class AddCommentsCountToImages < ActiveRecord::Migration
  def change
    add_column :images, :comments_count, :integer
  end
end
