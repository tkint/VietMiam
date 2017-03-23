class RecipesController < ApplicationController

  helper_method :has_rights?

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  def index
    size = APP_CONFIG["element_per_page"]
    page = params[:page].to_i || 0
    @pages = (Recipe.all.size.to_f / size.to_f).ceil - 1
    @recipes = Recipe.all[page * size, size]
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /recipes/1
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  def has_rights?(entity, action, id = nil)
    if !current_user.nil?
      entity_query = BaseEntity.where(:singular => entity).or(BaseEntity.where(:plural => entity)).first
      if !entity_query.nil?
        entity_id = entity_query.id
        if !entity_id.nil?
          right = Right.where(:user_group_id => current_user.user_group_id, :base_entity_id => entity_id).first
          if (id.nil? and params[:id].nil?) ^ entity != 'recipe'
            case action
              when 'new', 'create'
                return right.right_create
              when 'index', 'show'
                return right.right_read
            end
          else
            recipe = Recipe.find((id.nil? ? params[:id] : id))
            case action
              when 'edit', 'update'
                if recipe.user_id == current_user.id
                  return right.right_update_self
                else
                  if recipe.user.user_group_id == current_user.user_group_id
                    return right.right_update_actual_group
                  else
                    if recipe.user.user_group.level > current_user.user_group.level
                      return right.right_update_upper_group
                    else
                      return right.right_update_lesser_group
                    end
                  end
                end
              when 'destroy'
                if recipe.user_id == current_user.id
                  return right.right_delete_self
                else
                  if recipe.user.user_group_id == current_user.user_group_id
                    return right.right_delete_actual_group
                  else
                    if recipe.user.user_group.level > current_user.user_group.level
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
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:name, :user_id)
  end
end
