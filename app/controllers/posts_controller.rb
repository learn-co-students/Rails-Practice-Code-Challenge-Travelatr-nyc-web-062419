class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:message] = "Post successfully created"
      redirect_to @post
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  def edit
    @post = Post.find(params[:id])
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def upvote
    @post = Post.find(params[:id])
    Post.increment_counter(:likes, (params[:id]))
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:blogger_id, :destination_id, :title, :content)
  end
  
end
