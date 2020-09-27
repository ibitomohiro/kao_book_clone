class PostsController < ApplicationController
  
  def home
    if logged_in?
      @post = current_user.posts.build
    end
  end

  def new
    @post = current_user.posts.build if logged_in?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Posted successfully!"
      redirect_to new_post_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

end