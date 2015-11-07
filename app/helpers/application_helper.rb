module ApplicationHelper
  def friend_request_sent friend_id
    friend_request = Friend.find_by user_id: current_user.id, friend_id: friend_id
    return !friend_request.nil?
  end

  def is_friend friend_id
    active_friend_request = Friend.find_by user_id: current_user.id, friend_id: friend_id
    passive_friend = Friend.find_by user_id: friend_id, friend_id: current_user.id

    if active_friend_request.nil?
      if passive_friend.nil?
        return false
      else
        return passive_friend.accepted
      end
    else
      return active_friend_request.accepted
    end
  end
end
