Rails.application.routes.draw do
  root 'top_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  resources :users, only: %i[index new edit create update]
  resources :top_pages, only: %i[top] do
    collection do
      get 'search'
    end
  end
  resources :youtube_search, only: %i[top index]
  resources :search_result, only: %i[index]
  resources :music, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
