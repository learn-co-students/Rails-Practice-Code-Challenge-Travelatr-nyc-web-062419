class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all 
    end
    def show
        @blogger = Blogger.find(params[:id])
        if @blogger.posts.length > 0
            @featured = @blogger.posts.max_by {|p| p.likes}.title
        else 
            @featured = "#{@blogger.name} has no articles written!"
        end
    end
    def new
        @blogger = Blogger.new
    end
    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.valid?
            @blogger.save
        else 
            flash.now[:message] = @blogger.errors.full_messages[0]
            render :new
        end
    end

    private
    def blogger_params
        params.require(:blogger).permit(:name,:age,:bio)
    end
end
