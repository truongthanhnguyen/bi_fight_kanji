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

  def self.ransackable_attributes auth_object = nil
    (column_names - ["id","updated_at", "sign_in_count","encrypted_password",
      "reset_password_token", "reset_password_sent_at", "remember_created_at",
      "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip",
      "confirmed_at", "confirmation_token", "confirmation_sent_at", "unconfirmed_email"])+ _ransackers.keys
  end
end
