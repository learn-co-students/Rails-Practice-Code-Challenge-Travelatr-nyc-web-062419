Rails.application.routes.draw do
  #posts
  get 'posts/new', to: "posts#new", as: "new_post"
  get 'posts/:id', to: "posts#show", as: 'post'
  get 'posts/:id/:edit', to: 'posts#edit', as: "edit_post"
  post 'posts/', to: 'posts#create'
  patch 'posts/:id', to: 'posts#update'
  post 'posts/:id/', to: 'posts#likes'

  #bloggers
  get 'bloggers/new', to: "bloggers#new", as: "new_blogger"
  get 'bloggers/:id', to: "bloggers#show", as: 'blogger'
  post 'bloggers', to: 'bloggers#create'
  
  #destinations
  get 'destinations/:id', to: "destinations#show", as: 'destination'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
