Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  
  root to: 'public/homes#top'
  
  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    
    resources :users,  only: [:show, :edit, :update] do
      get '/users/unsubscribe' => 'users#unsubscribe'
      patch '/users/withdrawal' => 'users#withdrawa'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    resources :posts, only: [:index,:show,:edit,:create,:destroy,:update] do
      resource :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    
    get 'searches/search' => "searches#search", as: 'search'
  end
  
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
