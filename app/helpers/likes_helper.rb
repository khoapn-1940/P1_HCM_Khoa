module LikesHelper
  def liked? review_id
    return true if current_user.likes.find_by(review_id: review_id).nil?
    false
  end
end
