Rails.application.routes.draw do
  resources :contexts
  resources :courses
  resources :events
  resources :forum_discussions
  resources :forum_posts
  resources :forums
  resources :resources
  resources :role_assignments
  resources :users
  root 'welcome#index'
  post 'users/vEmail', to: 'users#vEmail'
  get 'users/emailErroneo', to: 'users#emailErroneo'

  get 'contexts/course/:id', to: 'contexts#course'

  get 'resources/recursosPorCurso/:course', to: 'resources#recursosPorCurso'

  get 'events/eventosPorCurso/:courseid', to: 'events#eventosPorCurso'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
