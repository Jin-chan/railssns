class User < ActiveRecord::Base
  has_secure_password    # 基本的な認証機能を持たせる
  validates :name, :email, presence: true  # nameとemailが必須
end
