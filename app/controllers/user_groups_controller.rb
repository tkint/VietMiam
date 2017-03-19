class UserGroupsController < ApplicationController
  before_action :set_user_group, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    size = 3
    page = params[:page].to_i || 0
    @pages = (UserGroup.all.size.to_f / size.to_f).ceil - 1
    @user_groups = UserGroup.all[page * size, size]
  end

  # GET /users/1
  def show
    @users = @user_group.users.all
  end

  # GET /user_groups/new
  def new
    @user_group = UserGroup.new
  end

  # GET /user_groups/1/edit
  def edit
  end

  # POST /user_groups
  def create
    @user_group = UserGroup.new(user_group_params)

    respond_to do |format|
      if @user_group.save
        BaseEntity.all.each do |base_entity|
          right = Right.new
          right.user_group_id = @user_group.id
          right.base_entity_id = base_entity.id
          right.right_create = false
          right.right_read = false
          right.right_update = false
          right.right_delete = false
          right.save
        end

        format.html { redirect_to user_group_url(@user_group), notice: 'User group was successfully created.' }
        format.json { render :show, status: :created, location: @user_group }
      else
        format.html { render :new }
        format.json { render json: @user_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_groups/1
  def update
    respond_to do |format|
      if @user_group.update(user_group_params)
        format.html { redirect_to user_group_url(@user_group), notice: 'User group was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_group }
      else
        format.html { render :edit }
        format.json { render json: @user_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_groups/1
  def destroy
    @user_group.destroy
    respond_to do |format|
      format.html { redirect_to user_groups_url, notice: 'User group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_group
    @user_group = UserGroup.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_group_params
    params.require(:user_group).permit(:name, :level, rights_attributes: [:id, :right_create, :right_read, :right_update, :right_delete])
  end
end
