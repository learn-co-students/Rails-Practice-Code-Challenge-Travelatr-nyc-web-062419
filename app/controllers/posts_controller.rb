class PostsController < ApplicationController
  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to @post
    else
      flash.now[:message] = @post.errors.full_messages[0]
      @bloggers = Blogger.all
      @destinations = Destination.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      flash.now[:message] = @post.errors.full_messages[0]
      @bloggers = Blogger.all
      @destinations = Destination.all
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def likes
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end
