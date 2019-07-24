class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

def uniq_bloggers
    self.posts.map {|p| p.blogger}.uniq
end
end
