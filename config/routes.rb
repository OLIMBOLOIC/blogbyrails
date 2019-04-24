Rails.application.routes.draw do
resources :posts do
    resources :commentaires
end
root "posts#index"
end
