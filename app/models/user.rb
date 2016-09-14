class User < ApplicationRecord
  validates :username, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: false, length: {maximum: 255},
            uniqueness: {case_sensitive: false}, allow_blank: true, format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates_numericality_of :age, allow_blank: true
end
