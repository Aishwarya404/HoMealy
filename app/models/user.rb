class User < ApplicationRecord
    has_secure_password
    # def self.add_users()
       
    #     us = User.find_by_sql(["select name from users where users.zipcode = '0000'"])
    #     return [us[0]["name"]]
    # end

    before_save { self.email = email.downcase }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true, length: { minimum: 2, maximum: 100 }
    validates :name, presence: true, length: { maximum: 100 }
    validates :zipcode, presence: true, length: {maximum: 5}
end
