class ArticlesController < ApplicationController
  # GET /articles
  def index
    size = 3
    page = params[:page].to_i || 0
    @pages = (Article.all.size.to_f / size.to_f).ceil - 1
    @articles = Article.all[page * size, size]
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end
end
