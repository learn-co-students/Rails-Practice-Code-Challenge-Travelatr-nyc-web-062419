class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all

    render :index
  end

  def show
    @blogger = Blogger.find params[:id]
    @likes = @blogger.posts.sum(:likes)
    @posts = @blogger.posts
    @featured_post =  @posts.order(likes: :desc).first 
    @destinations = @blogger.destinations.max_by(5) {|destinations| destinations.posts.count}
    render :show
  end

  def new
    @blogger = Blogger.new
    render :new
  end

  def create
    @blogger = Blogger.new blogger_params
    if @blogger.valid?
      @blogger.save
      flash[:message] = "Welcome #{@blogger.name}"
      redirect_to blogger_path(@blogger.id)
    else
      flash.now[:message] = @blogger.errors.full_messages
      render :new
    end
  end

  def edit

    render :edit
  end

  private 

  def blogger_params
    params.require(:blogger).permit(:name,:bio,:age)
  end
end
