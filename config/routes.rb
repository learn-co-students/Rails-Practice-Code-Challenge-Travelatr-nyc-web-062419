Rails.application.routes.draw do

  resources :bloggers, except: :destroy
  resources :posts, except: :destroy
  resources :destinations, except: [:destroy, :new, :create, :edit, :update]

  patch 'posts/:id/upvote', to: "posts#upvote"

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
