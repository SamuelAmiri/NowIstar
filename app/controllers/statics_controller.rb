class StaticsController < ApplicationController
  def home
  @categories = Category.all
  end

  def about
  end

  def contact
  end
end
