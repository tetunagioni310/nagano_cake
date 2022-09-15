Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end

  namespace :admin do
    root 'homes#top'
    get 'homes/top'
    resources :genres, only: [:index,:show,:edit,:create,:destroy,:update]
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