Rails.application.routes.draw do
  root to: "public/homes#top"
  
  namespace :public do
    resources :homes, only: [:top] 
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