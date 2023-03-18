Rails.application.routes.draw do

  
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}


  namespace :public do
  resources :ships, only: [:new, :create, :index, :show, :destroy] do
    resources :reviews, only: [:create]
   end
  resources :posts, only: [:new, :create, :index, :show, :destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy,:update]
   end
  resources :homes
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  end



 namespace :admin do
    resources :homes, only: [:index]
    resources :users, onry: [:index,:edit,:update]
    resources :post_comments, onry:[:index,:update]
    resources :ships
    resources :cities
    resources :posts, onry: [:index,:show,:destroy]
    resources :reviews, onry: [:index,:show,:update]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
