class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_goals
  has_many :user_logs
  has_many :active_friend_requests, class_name: "Friend", foreign_key: "user_id"
  has_many :passive_friend_requests, class_name: "Friend", foreign_key: "friend_id"

  def send_request friend_id
  	friend_request = self.active_friend_requests.create friend_id: friend_id, accepted: false
  	friend_request.save
  end

  def cancel_request friend_id
  	Friend.find_by(user_id: self.id ,friend_id: friend_id).destroy
  end

  def change_request_status friend_id
    friend_record = Friend.find_by user_id: friend_id, friend_id: self.id
    friend_record.accepted = !friend_record.accepted
    friend_record.save
  end

  def self.ransackable_attributes auth_object = nil
    (column_names - ["id","updated_at", "sign_in_count","encrypted_password",
      "reset_password_token", "reset_password_sent_at", "remember_created_at",
      "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip",
      "confirmed_at", "confirmation_token", "confirmation_sent_at", "unconfirmed_email"])+ _ransackers.keys
  end
end
