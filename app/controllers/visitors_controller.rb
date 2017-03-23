class VisitorsController < ApplicationController
  def index
    if has_rights?('article', 'index')
      @articles = Article.first(3)
    end
    if has_rights?('recipe', 'index')
      @recipes = Recipe.first(3)
    end
    @rights = current_user.user_group.rights
  end
end
