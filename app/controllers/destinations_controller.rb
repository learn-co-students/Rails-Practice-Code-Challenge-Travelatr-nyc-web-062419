class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @last_five = @destination.posts.order(created_at: :asc).take(5)
        @top_post = @destination.posts.max_by {|p| p.likes}
        @average_age = @destination.uniq_bloggers.map {|b| b.age}.reduce(:+)/@destination.uniq_bloggers.length
    end

    def index
    @unvisited = Destination.all.select {|d| d.posts.length == 0}
    @visited = Destination.all.select {|d| d.posts.length > 0}
    end
   
end
