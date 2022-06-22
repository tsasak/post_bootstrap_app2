class PostsController < ApplicationController
  # ***** 以下を追加 *****
  before_action :set_post, only: %i[show edit update destroy]
  # ***** 以上を追加 *****
 
  def index
     @posts = Post.order(id: :asc)
  end

  def show
    # ***** 修正 *****
  end

  def new
     @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
         redirect_to @post, notice: "投稿しました"
    else
         flash.now[:alert] = "投稿に失敗しました"
         render :new
    end
  end

  def edit
    # ***** 修正 *****
  end

  def update
     if @post.update(post_params)
             redirect_to @post, notice: "更新しました"
     else
             flash.now[:alert] = "更新に失敗しました"
             render :edit
     end
  end

  def destroy
     # ***** 修正(@を追加しているので注意！) *****
     @post.destroy!
     redirect_to @post, alert: "削除しました"
  end

  private

  # ***** 以下を追加 *****
  def set_post
     @post = Post.find(params[:id])
  end
  # ***** 以上を追加 *****

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
