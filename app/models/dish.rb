class Dish < ApplicationRecord

    def self.add_dishes()
        dishes = [
            {"dishname": "French Fries", "user_email": "rosh", "price": 4, "quantity": 8, "cuisine": "Belgian", "description": "Crispy Fries"},
            {"dishname": "Sloppy Joe", "user_email": "sai", "price": 11.5, "quantity": 5, "cuisine": "American", "description": "Yummy burgers"}
        ]
        dishes.each do |dish|
            curr_dish = Dish.new(dish)
            curr_dish.save!
        end
        ans = Dish.find_by_sql(["select dishname from dishes"])
        return [ans[0]["dishname"], ans[1]["dishname"]]
        
    end

    def self.get_first_two()
        return Dish.all

    end

end