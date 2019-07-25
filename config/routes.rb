Rails.application.routes.draw do
  resources :posts
  resources :destinations
  resources :bloggers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  patch '/posts/:id/like', to: 'posts#like'
end
