Rails.application.routes.draw do
  get 'fish_nutrients/result'
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post 'guest_login', to: 'user_sessions#guest_login'
  get 'calculation', to: 'fish_nutrients#calculation'
  get 'result', to: 'fish_nutrients#result'
  get 'recipe', to: 'recipes#recipe'

  resources :nutrient_categories, only: %i[create]
  resources :question_evaluations, only: %i[new create]
  resources :users, only: %i[new create]
end
