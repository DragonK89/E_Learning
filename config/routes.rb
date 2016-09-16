Rails.application.routes.draw do

  root 'sessions#new'

  get '/signup/student', to: 'users#new_student'
  get '/signup/teacher', to: 'users#new_teacher'
  post '/signup/student', to: 'users#create_student'
  post '/signup/teacher', to: 'users#create_teacher'
  get '/edit', to: 'users#edit', as: 'edit'
  patch '/edit', to: 'users#update'
  patch '/edit/user/:id', to: 'users#change_status', as: 'update_status'
  get '/home', to: 'users#show', as: 'home'
  get '/users', to: 'users#index', as: 'index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/class/add', to: 'courses#new'
  post '/class/add', to: 'courses#create'
  get '/class/edit/:id', to: 'courses#edit'
  patch '/class/edit/:id', to: 'courses#update', as: 'class_edit'
  get '/users/classes', to: 'courses#index', as: 'my_classes'
  get '/classes', to: 'courses#all_classes'
end
