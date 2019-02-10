Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
    resources :albums, only: :show
  end

  unauthenticated :user do
    root to: 'home#index'
  end
end
