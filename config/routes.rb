Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root to: 'static_pages#top'
end
