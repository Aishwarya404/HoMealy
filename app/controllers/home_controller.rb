class HomeController < ApplicationController
  def main
    @dishes = Dish.all
  end
end
