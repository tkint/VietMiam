class VisitorsController < ApplicationController
  def index
    @users = User.all
    @articles = Article.all
  end
end
