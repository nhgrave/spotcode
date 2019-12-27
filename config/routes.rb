Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root

    resources :albums, only: [ :show ] do
      resource :favorite, only: [ :create, :destroy ], defaults: { format: :js, favoritable_type: "Album" }
    end

    resources :artists, only: [ :show ] do
      resource :favorite, only: [ :create, :destroy ], defaults: { format: :js, favoritable_type: "Artist" }
    end

    resources :songs, only: [] do
      resource :favorite, only: [ :create, :destroy ], defaults: { format: :js, favoritable_type: "Song" }
    end

    resources :categories, only: [ :show ]

    resources :favorites, only: [ :index ]

    resources :search, only: [ :index, :new ]
  end

  unauthenticated :user do
    root to: 'home#index'
  end
end
