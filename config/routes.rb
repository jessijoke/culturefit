Rails.application.routes.draw do
  resources :messages
  get 'private/test'
  resources :answer_attributes
  resources :quiz_answers
  resources :quiz_questions
  resources :quizzes
  resources :users
  resources :user_attributes
  post "/login", to: "users#login"
  get '/current_user', to: 'current_user#index'
  get '/user_attributes/unique', :to => 'user_attributes#unique'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
