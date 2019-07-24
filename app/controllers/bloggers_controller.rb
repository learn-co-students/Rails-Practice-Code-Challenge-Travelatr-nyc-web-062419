class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      flash.now[:message] = @blogger.errors.full_messages[0]
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
    @ranking = @blogger.posts.max_by(5){|post| post.destination}.map {|x| x.destination}.uniq
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.find(params[:id])
      if @blogger.update_attributes(blogger_params)
        flash[:success] = "Blogger was successfully updated"
        redirect_to blogger_path(@blogger)
      else
        flash[:message] = "Something went wrong"
        render 'edit'
      end
  end
  

  private

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end
end
