class HomeController < ApplicationController
  def index
  end

  def main
    @dishes = Dish.all
  end
end
