Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup/student', to: 'users#new_student'
  get '/signup/teacher', to: 'users#new_teacher'
  post '/signup/student', to: 'users#create_student'
  post '/signup/teacher', to: 'users#create_teacher'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
