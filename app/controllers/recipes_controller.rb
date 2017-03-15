class RecipesController < ApplicationController
  # GET /recipes
  def index
    size = 3
    page = params[:page].to_i || 0
    @pages = (Recipe.all.size.to_f / size.to_f).ceil - 1
    @recipes = Recipe.all[page * size, size]
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find(params[:id])
  end
end
