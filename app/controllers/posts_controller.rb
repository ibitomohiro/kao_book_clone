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

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_path(current_user.id)
  end

  def create
    @post = current_user.posts.build(post_params)
    @user = @post.user
    if @post.save
      flash[:success] = "Posted successfully!"
      redirect_to (user_url(@user.id))
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

  def confirm 
    @post = current_user.posts.new(post_params)
     if @post.invalid?
      flash.now[:danger] = "contents and image must be filled in!"
      render 'new'
     end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end

end