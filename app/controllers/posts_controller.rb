class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    @blogger = @post.blogger
    @destination = @post.destination
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all   
    @destinations = Destination.all.uniq
  end

  def edit
    @post = Post.find params[:id]
    @bloggers = Blogger.all   
    @destinations = Destination.all 
  end
  
  def update
    @post = Post.find params[:id]
    @bloggers = Blogger.all   
    @destinations = Destination.all 
    if @post.update (post_params)
      flash[:message] = "Updated"
      redirect_to post_path(@post.id)
    else
      flash.now[:message] = @post.errors.full_messages
      render :edit
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.update(likes: params[:likes])
    redirect_to @post
  end


  def create
    @post = Post.new post_params
    @bloggers = Blogger.all   
    @destinations = Destination.all 
    if @post.valid?
      @post.save
      flash[:message] = "#{@post.title} Created"
      redirect_to post_path(@post.id)
    else
      flash.now[:message] = @post.errors.full_messages
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:title,:content,:likes,:blogger_id,:destination_id)
  end
end
