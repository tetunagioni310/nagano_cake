Rails.application.routes.draw do
  namespace :public do
    get 'cart_items/index'
  end
  root to: "public/homes#top"

  namespace :public do
    get 'home/about', to: 'homes#about'
    resources :items, only: [:index,:show]
    resources :cart_items, only: [:index,:create,:destroy,:update,]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit,:update]
    resources :genres, only: [:index,:show,:edit,:create,:destroy,:update]
    resources :items
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers ,skip: [:password], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

end