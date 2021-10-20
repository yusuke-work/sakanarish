Rails.application.routes.draw do
  root to: 'static_pages#top'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  resources :quesitons, only: %i[index]
  resources :users, only: %i[new create]
end
