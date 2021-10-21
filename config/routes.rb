Rails.application.routes.draw do
  root to: 'static_pages#top'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  resources :questions, only: %i[index]
  resources :question_evaluations, only: %i[index create]
  resources :nutrient_categories, only: %i[create]
  resources :users, only: %i[new create]
end
