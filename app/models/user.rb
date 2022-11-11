class User < ApplicationRecord
    has_secure_password

    before_save { self.email = email.downcase }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true, length: { minimum: 6, maximum: 100 }
    validates :name, presence: true, length: { maximum: 100 }
    validates :zipcode, presence: true, length: {maximum: 5}
    validates :address, presence: true, length: { maximum: 100 }
end
