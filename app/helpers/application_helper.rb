module ApplicationHelper
  def friend_request_sent friend_id
    friend_request = Friend.find_by user_id: current_user.id, friend_id: friend_id
    return !friend_request.nil?
  end

  def is_friend friend_id
    friend_request = Friend.find_by user_id: current_user.id, friend_id: friend_id
    return !friend_request.nil? && friend_request.accepted
  end
end
