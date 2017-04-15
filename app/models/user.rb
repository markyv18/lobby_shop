class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness:true

  has_secure_password
  has_many :orders

  enum role: %w(user admin)

  def admin?
    role == "admin"
  end
end
