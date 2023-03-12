Rails.application.routes.draw do

  namespace :public do
  resources :ships
  resources :users
  resources :homes
  end

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
    resources :ships
    resources :cities
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
