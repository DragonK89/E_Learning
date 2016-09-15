Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup/student', to: 'users#new_student'
  get '/signup/teacher', to: 'users#new_teacher'
  post '/signup/student', to: 'users#create_student'
  post '/signup/teacher', to: 'users#create_teacher'
  get '/edit', to: 'users#edit', as: 'edit'
  patch '/edit/update/:id', to: 'users#change_status', as: 'update_status'
  patch '/edit', to: 'users#update'
  get '/home', to: 'users#show', as: 'home'
  get '/index', to: 'users#index', as: 'index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # resources :users
end
