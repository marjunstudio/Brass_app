Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#index'

  get 'guide', to: 'static_pages#guide'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  resources :static_pages do
    get :search, on: :collection
  end

  resources :users, only: %i[new create]
  resources :likes, only: %i[index create destroy]

  resource :profile, only: %i[show edit update]

  resources :youtube_search, only: %i[top index]
  resources :search_result, only: %i[index]
end
