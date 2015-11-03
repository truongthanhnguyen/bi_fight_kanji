class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_goals
  has_many :user_logs
  has_many :friends

  def send_request current_user, friend_id
  	friend_request = current_user.friends.create friend_id: friend_id, accepted: false
  	friend_request.save
  end

  def cancel_request current_user, friend_id
  	Friend.find_by(friend_id: friend_id).destroy
  end
end
