class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find params[:id]
    @posts = @destination.posts.order(updated_at: :desc).limit(5)
    @bloggers = @destination.bloggers.average(:age).round.to_i
    @favorite_post = @destination.posts.order(likes: :desc).first
  end

  def new
  end

  def edit
  end
end
