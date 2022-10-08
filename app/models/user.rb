class User < ApplicationRecord
  has_many :tasks, dependent: :type
  has_secure_password
  enum role: { admin: 0, user: 1}
  validates :name, presence: true
  validates :password, presence: true

end
