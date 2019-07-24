class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def show
        @post = Post.find(params[:id])
        @content = @post.content
    end
    def new
        @post = Post.new
        @destinations = Destination.all 
        @bloggers = Blogger.all 
    end
    def create
        @post = Post.create(post_params)
    end
    def smash
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to post_path(@post.id)
    end


    private 
    def post_params
        params.require(:post).permit(:blogger_id,:destination_id,:content,:title)
    end

end
