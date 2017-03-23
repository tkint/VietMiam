class ArticlesController < ApplicationController

  helper_method :has_rights?

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    size = APP_CONFIG["element_per_page"]
    page = params[:page].to_i || 0
    @pages = (Article.all.size.to_f / size.to_f).ceil - 1
    @articles = Article.all[page * size, size]
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  def has_rights?(entity, action, id = nil)
    if !current_user.nil?
      entity_query = BaseEntity.where(:singular => entity).or(BaseEntity.where(:plural => entity)).first
      if !entity_query.nil?
        entity_id = entity_query.id
        if !entity_id.nil?
          right = Right.where(:user_group_id => current_user.user_group_id, :base_entity_id => entity_id).first
          if (id.nil? and params[:id].nil?) ^ entity != 'article'
            case action
              when 'new', 'create'
                return right.right_create
              when 'index', 'show'
                return right.right_read
            end
          else
            article = Article.find((id.nil? ? params[:id] : id))
            case action
              when 'edit', 'update'
                if article.user_id == current_user.id
                  return right.right_update_self
                else
                  if article.user.user_group_id == current_user.user_group_id
                    return right.right_update_actual_group
                  else
                    if article.user.user_group.level > current_user.user_group.level
                      return right.right_update_upper_group
                    else
                      return right.right_update_lesser_group
                    end
                  end
                end
              when 'destroy'
                if article.user_id == current_user.id
                  return right.right_delete_self
                else
                  if article.user.user_group_id == current_user.user_group_id
                    return right.right_delete_actual_group
                  else
                    if article.user.user_group.level > current_user.user_group.level
                      return right.right_delete_upper_group
                    else
                      return right.right_delete_lesser_group
                    end
                  end
                end
            end
          end
        end
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end

end
