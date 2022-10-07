Rails.application.routes.draw do

  root to: "public/homes#top"

  namespace :public do
    get 'homes/about', to: 'homes#about'

    resources :orders, only: [:index,:show,:new,:create] do
      collection do
        get 'thanks'
        post 'log'
      end
    end

    resources :addresses, only: [:index,:edit,:create,:destroy,:update]
    resources :genres, only: [:show]
    resources :items, only: [:index,:show]
    resources :customers, only: [:edit,:update,:show] do
    collection do
      get 'quit'
      patch 'withdrawal'
      end
    end

    resources :cart_items, only: [:index,:create,:destroy,:update] do
    collection do
      delete 'destroy_all'
      end
    end
  end

  namespace :admin do
    get 'homes/top', to: 'homes#top'
    resources :customers, only: [:index, :show, :edit,:update] 
    resources :genres, only: [:index,:show,:edit,:create,:destroy,:update]
    resources :items
    resources :orders, only: [:index,:show,:update]
    resources :order_details, only: [:update]
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