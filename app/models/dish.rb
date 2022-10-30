class Dish < ApplicationRecord

    def self.add_dishes()
        dishes = [
            {"dishname": "French Fries", "user_email": "rosh@gmail.com", "price": 4, "quantity": 8, "cuisine": "Belgian", "description": "Crispy Fries"},
            {"dishname": "Sloppy Joe", "user_email": "sai@gmail.com", "price": 11.5, "quantity": 5, "cuisine": "American", "description": "Yummy burgers"}
        ]
        dishes.each do |dish|
            curr_dish = Dish.new(dish)
            curr_dish.save!
        end
        ans = Dish.find_by_sql(["select dishname from dishes"])
        return [ans[0]["dishname"], ans[1]["dishname"]]
        
    end

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :dishname, presence: true, length: { maximum: 100 }
    validates :user_email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
    validates :cuisine, presence: true, length: { maximum: 20 }
    validates :price, presence: true, length: {maximum: 5}
    validates :quantity, presence: true, length: {maximum: 5}
end
