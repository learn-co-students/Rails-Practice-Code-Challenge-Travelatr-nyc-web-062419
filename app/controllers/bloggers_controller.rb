class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to @blogger
    else
      flash.now[:message] = @blogger.errors.full_messages[0]
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  private
  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end
end

