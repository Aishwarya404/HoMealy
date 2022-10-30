class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    
    def self.add_users()
        
        users = [
            {"email": "sai@gmail.com", "password_digest": "ram", "name": "sairam", "zipcode": "10027"},
            {"email": "aish@gmail.com", "password_digest": "warya", "name": "aishwarya", "zipcode": "10028"},
]
        users.each do |user|
            curr_user = User.new(user)
            curr_user.save!
        end
        
        us = User.find_by_sql(["select name from users where users.zipcode = '10027'"])
        return [us[0]["name"]]
        
    end

    before_save { self.email = email.downcase }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true, length: { minimum: 2, maximum: 100 }
    validates :name, presence: true, length: { maximum: 100 }
    validates :zipcode, presence: true, length: {maximum: 5}
end
