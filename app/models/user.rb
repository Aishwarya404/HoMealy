class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    
    def self.add_users()
        
        users = [
            {"email": "sai", "password_digest": "ram", "name": "sairam", "zipcode": "10027"},
            {"email": "aish", "password_digest": "warya", "name": "aishwarya", "zipcode": "10028"},
]
        users.each do |user|
            curr_user = User.new(user)
            curr_user.save!
        end

        us = User.find_by_sql(["select name from users where users.zipcode = '10027'"])
        return [us[0]["name"]]
        
    end
end
