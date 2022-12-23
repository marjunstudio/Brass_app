Rails.application.routes.draw do
  root 'top_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  resources :users, only: %i[index new create]
  resources :top_pages, only: %i[top index]
  resources :youtube_search, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
