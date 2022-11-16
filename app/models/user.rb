class User < ApplicationRecord
    has_secure_password

    before_save { self.email = email.downcase }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\d{10}/i
    VALID_ZIPCODE_REGEX = /\d{5}/i
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true, length: { minimum: 6, maximum: 100 }
    validates :phone, presence: true, length: { maximum: 10 }, format: { with: VALID_PHONE_REGEX }
    validates :name, presence: true, length: { maximum: 100 }
    validates :zipcode, presence: true, length: {maximum: 5}, format: { with: VALID_ZIPCODE_REGEX }
    validates :address, presence: true, length: { maximum: 100 }
end
