Rails.application.routes.draw do
  devise_for :users
resources :posts do
    resources :commentaires
end
root "posts#index"
get '/about', to: 'pages#about'
end

