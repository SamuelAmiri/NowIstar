class StaticsController < ApplicationController
  def home
  @categories = Category.all
  end

  def about
  @categories = Category.all
  end

  def contact
  @categories = Category.all
  end
end
