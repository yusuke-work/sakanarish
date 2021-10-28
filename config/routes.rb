Rails.application.routes.draw do
  root to: 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  post 'guest_login', to: 'user_sessions#guest_login'
  delete 'logout', to: 'user_sessions#destroy'

  get 'calculation', to: 'fish_nutrients#calculation'
  get 'result', to: 'fish_nutrients#result'
  # お気に入りしたレシピ
  get 'recipe/favorites', to: 'fish_nutrients#favorites'

  # apiのディレクトで叩くようにしたらコントローラはいらないかも
  get 'recipe', to: 'recipes#recipe'
  
  resource :my_pages, only: %i[show]
  resources :favorites, only: %i[create destroy] 
  resources :users, only: %i[new create]
  resources :question_evaluations, only: %i[new create]

end
