class VisitorsController < ApplicationController
  def index
    @users = User.all
    @articles = Article.first(3)
  end
end
