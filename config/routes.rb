Rails.application.routes.draw do
  resources :forum_posts
  resources :forums
  resources :resources
  resources :role_assignments
  resources :users
  root 'welcome#index'
  post 'users/vEmail', to: 'users#vEmail'
  get 'users/emailErroneo', to: 'users#emailErroneo'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
