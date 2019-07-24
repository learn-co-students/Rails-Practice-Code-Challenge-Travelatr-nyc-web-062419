Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  patch "/posts/:id/smash", to: "posts#smash", as: "smash"
  resources :bloggers,:destinations,:posts
end
