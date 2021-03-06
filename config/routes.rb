Rails.application.routes.draw do
  resources :assignsubmission_files
  resources :assignment_submissions
  resources :mdl_files
  resources :contexts
  resources :courses do
    member do
      get 'courses/add_course/:id', to: 'courses#addCourse', as: 'add_course'
    end
    collection do
      get 'courses/register_course/:id', to: 'courses#registerCourse', as: 'register_course'
    end
  end
  resources :events
  resources :forum_discussions
  resources :forum_posts
  resources :forums
  resources :resources
  resources :role_assignments
  resources :users

  root 'welcome#index'

  get 'users/vEmail/:id', to: 'users#vEmail'

  get 'users/vContrasena/:email', to: 'users#vContrasena'

  post 'users/contrasena', to: 'users#contrasena'

  post 'users/email', to: 'users#email'

  get 'users/emailErroneo', to: 'users#emailErroneo'

  get 'users/contrasenaErronea', to: 'users#contrasenaErronea'

  get 'contexts/course/:id', to: 'contexts#course'

  get 'resources/recursosPorCurso/:course', to: 'resources#recursosPorCurso'

  get 'events/eventosPorCurso/:courseid', to: 'events#eventosPorCurso'

  get 'events/eventosDetalle/:eventid/:courseid', to: 'events#eventosDetalle'

  get 'forums/forosPorCurso/:course', to: 'forums#forosPorCurso'

  get 'forum_discussions/discusionesPorForo/:forum', to: 'forum_discussions#discusionesPorForo'

  get 'forum_posts/postPorDiscusionPrincipal/:discussion', to: 'forum_posts#postPorDiscusionPrincipal'

  get 'forum_posts/postRespuestas/:discussion', to: 'forum_posts#postRespuestas'

  get 'forum_posts/sinPosts', to: 'forum_posts#sinPosts'

  get 'forum_discussions/sinDiscusiones', to: 'forum_discussions#sinDiscusiones'

  get 'events/sinEventos/:courseid', to: 'events#sinEventos'

  get 'resources/sinRecursos/:course', to: 'resources#sinRecursos'

  get 'contexts/sinCursos/:id', to: 'contexts#sinCursos'

  get 'courses/buscar/:id', to: 'courses#buscar'

  post 'courses/cursos', to: 'courses#cursos'

  get 'courses/sinCursos/', to: 'courses#sinCursos'

  get 'forum_posts/felicitaciones', to: 'forum_posts#felicitaciones'

  get 'forum_posts/error', to: 'forum_posts#error'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'resources/descarga/:course/:timemodified', to: 'resources#descarga'

  get 'resources/descargaINT/:variablePatito', to: 'resources#descargaINT'

  get 'events/emailProf/:id', to: 'events#emailProf'

  post 'events/enviarCorreo', to: 'events#enviarCorreo'

  get 'events/envioExitoso/:courseid', to: 'events#envioExitoso'

  match 'enviarCorreo', to: 'event#send_mail', via: 'post'

  post 'uploadfiles'=>'events#upload'

end
