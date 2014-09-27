module ApplicationHelper

  def comment_url_helper(comment)
    image = comment.image
    [image, comment]
  end

end
