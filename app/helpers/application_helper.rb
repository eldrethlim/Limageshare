module ApplicationHelper

  def comment_url_helper(comment)
    image = comment.image
    [image, comment]
  end

  def favourite_url_helper(favourite)
    image = favourite.image
    [image, favourite]
  end
end