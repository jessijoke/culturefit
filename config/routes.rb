Rails.application.routes.draw do
  get 'private/test'
  get '/current_user', to: 'current_user#index'
  get '/user_attributes/unique', to: 'user_attributes#unique_elements'
  resources :answer_attributes
  resources :quiz_answers
  resources :quiz_questions
  resources :quizzes
  resources :users
  resources :user_attributes
  post "/login", to: "users#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
