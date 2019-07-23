class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
    end

    def like

        @post = Post.find(params[:id])
        likes = @post.likes + 1
        @post.update(likes: likes)
        redirect_to post_path(@post)

    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:messages] = @post.errors.full_messages[0]
            @post = Post.new
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
            redirect_to post_path(@post)
        else
            flash[:messages] = @post.errors.full_messages[0]
            @post = Post.find(params[:id])
            @bloggers = Blogger.all
            @destinations = Destination.all
            render :edit
        end
    
    end



    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end


end