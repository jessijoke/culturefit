Rails.application.routes.draw do
  get 'private/test'
  get '/current_user', to: 'current_user#index'
  resources :answer_attributes
  resources :quiz_answers
  resources :quiz_questions
  resources :quizzes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
