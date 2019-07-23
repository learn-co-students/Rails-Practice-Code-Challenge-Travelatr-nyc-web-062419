Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'bloggers/new', to: "bloggers#new", as: 'new_blogger'
  get 'bloggers/:id', to: "bloggers#show", as: 'blogger'
  
  post '/bloggers', to: "bloggers#create"


  get 'destinations/:id', to: "destinations#show", as: 'destination'

  
  get 'posts/new', to: "posts#new", as: 'new_post'
  get 'posts/:id', to: "posts#show", as: 'post'
  get 'posts/:id/edit', to: "posts#edit", as: 'edit_post'

  patch 'posts/:id/like', to: "posts#like", as: 'like_post'
  patch 'posts/:id', to: "posts#update"
  post 'posts/', to: 'posts#create'



end
