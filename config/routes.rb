Rails.application.routes.draw do
  get 'sessions/new'
  resources :feeds do
    collection do
      post :confirm
      resources :sessions, only: [:new, :create, :destroy]
      resources :users, only: [:new, :create, :show]
    end
  end
end