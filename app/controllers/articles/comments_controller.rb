class Article::CommentsController < ApplicationController
  before_action :set_article_comment, only: [:show, :edit, :update, :destroy]

  # GET /article/comments
  # GET /article/comments.json
  def index
    @article_comments = Article::Comment.all
  end

  # GET /article/comments/1
  # GET /article/comments/1.json
  def show
  end

  # GET /article/comments/new
  def new
    @article_comment = Article::Comment.new
  end

  # GET /article/comments/1/edit
  def edit
  end

  # POST /article/comments
  # POST /article/comments.json
  def create
    @article_comment = Article::Comment.new(article_comment_params)

    respond_to do |format|
      if @article_comment.save
        format.html { redirect_to @article_comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @article_comment }
      else
        format.html { render :new }
        format.json { render json: @article_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article/comments/1
  # PATCH/PUT /article/comments/1.json
  def update
    respond_to do |format|
      if @article_comment.update(article_comment_params)
        format.html { redirect_to @article_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_comment }
      else
        format.html { render :edit }
        format.json { render json: @article_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article/comments/1
  # DELETE /article/comments/1.json
  def destroy
    @article_comment.destroy
    respond_to do |format|
      format.html { redirect_to article_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_comment
      @article_comment = Article::Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_comment_params
      params.require(:article_comment).permit(:content, :user_id, :article_id)
    end
end
