class User < ApplicationRecord

  has_secure_password #assign hashed password to password_digest
  has_one_attached :avatar 
  has_many :tasks, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: 'Must be a valid email address'} 
end
