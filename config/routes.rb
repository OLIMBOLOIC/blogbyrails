Rails.application.routes.draw do
  devise_for :utilisateurs
  get 'images/index'
resources :posts do
    resources :commentaires
end
root "posts#index"
end
