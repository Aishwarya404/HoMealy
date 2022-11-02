class Dish < ApplicationRecord

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :dishname, presence: true, length: { maximum: 30 }
    validates :user_email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
    validates :cuisine, presence: true, length: { maximum: 20 }
    validates :price, presence: true, length: {maximum: 5}, numericality: true
    validates :quantity, presence: true, length: {maximum: 5}, numericality: { only_integer: true }
end
