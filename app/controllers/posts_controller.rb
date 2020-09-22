class PostsController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def new
    @post = current_user.posts.new 
  end

  def create
    @post = current_user.posts.build(post_params)
    @user = User.find(current_user.id)
    if @post.save
      redirect_to new_post_path, notice: "投稿しました！"
    else
      render :new
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
