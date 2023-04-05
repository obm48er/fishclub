Rails.application.routes.draw do

root to: 'public/posts#index'

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}


  scope module: :public do
  resources :ships, only: [:new, :create, :index, :show, :destroy] do
    resources :reviews, only: [:create,:destroy]
   end
  resources :posts, only: [:new, :create, :index, :edit, :show, :destroy,:update] do
    collection do
      get 'search'
    end
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy,:update]
   
   end
  resources :homes
  resources :users do
    member do
    get :likes
  end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  end



 namespace :admin do
    resources :homes, only: [:index]
    resources :users
    resources :post_comments, only:[:index,:update]
    resources :ships
    resources :cities
    resources :posts
    resources :reviews, only: [:index,:show,:update]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
