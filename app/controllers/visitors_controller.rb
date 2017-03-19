class VisitorsController < ApplicationController
  def index
    if has_rights?('user', 'index')
      @users = User.all
    end
    if has_rights?('article', 'index')
      @articles = Article.first(3)
    end
    @rights = current_user.user_group.rights
  end
end
