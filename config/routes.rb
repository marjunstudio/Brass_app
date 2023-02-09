Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :top_pages, only: %i[top] do
    collection do
      get 'search'
    end
  end
  resources :youtube_search, only: %i[top index]
  resources :search_result, only: %i[index] do
    collection do
      get 'category'
      get 'composer'
      get 'word_search'
    end
  end
  resources :likes, only: %i[index create destroy]
end
