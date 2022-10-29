class User < ApplicationRecord
  has_many :tasks
  has_secure_password
  enum role: { admin: 0, user: 1}
  validates :name, presence: true
  validates :password, presence: true

end
