Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users 
 root 'posts#index', as:'home'
#get 'about' => 'pages#about', as: 'about'

 resources :posts do
 resources :comments
end
end
