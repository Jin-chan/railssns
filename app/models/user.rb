# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_and_belongs_to_many :friends, join_table: 'friendships',class_name: 'User', association_foreign_key: 'friend_id'
  has_secure_password    # 基本的な認証機能を持たせる
  validates :name, :email, presence: true  # nameとemailが必須
  has_many :post

  def friend?(user)
    self.friends.include?(user)
  end

  def add_friend(friend)
    User.transaction do
      self.friends << friend
      friend.friends << self
    end
  end

  def remove_friend(friend)
    User.transaction do
      self.friends.delete(friend)
      friend.friends.delete(self)
    end
  end
end
