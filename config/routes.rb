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

  get 'users/vEmail/:id', to: 'users#vEmail'

  post 'users/vContrasena', to: 'users#vContrasena'

  post 'users/email', to: 'users#email'

  get 'users/emailErroneo', to: 'users#emailErroneo'

  get 'contexts/course/:id', to: 'contexts#course'

  get 'resources/recursosPorCurso/:course', to: 'resources#recursosPorCurso'

  get 'resources/descarga/:course/:id', to: 'resources#descarga'

  get 'events/eventosPorCurso/:courseid', to: 'events#eventosPorCurso'

  get 'forums/forosPorCurso/:course', to: 'forums#forosPorCurso'

  get 'forum_discussions/discusionesPorForo/:forum', to: 'forum_discussions#discusionesPorForo'

  get 'forum_posts/postPorDiscusionPrincipal/:discussion', to: 'forum_posts#postPorDiscusionPrincipal'

  get 'forum_posts/postRespuestas/:discussion', to: 'forum_posts#postRespuestas'

  get 'forum_posts/sinPosts', to: 'forum_posts#sinPosts'

  get 'forum_discussions/sinDiscusiones', to: 'forum_discussions#sinDiscusiones'

  get 'events/sinEventos', to: 'events#sinEventos'

  get 'resources/sinRecursos/:course', to: 'resources#sinRecursos'

  get 'contexts/sinCursos/:id', to: 'contexts#sinCursos'

  get 'courses/buscar/:id', to: 'courses#buscar'

  post 'courses/cursos', to: 'courses#cursos'

  get 'courses/sinCursos/', to: 'courses#sinCursos'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
