Rails.application.routes.draw do
  get 'private/test'
  post "/login", to: "users#login"
  get 'current_user', to: 'current_user#index'
  get 'user_attributes/unique' => 'user_attributes#unique'
  resources :messages
  resources :answer_attributes
  resources :quiz_answers
  resources :quiz_questions
  resources :quizzes
  resources :users
  resources :user_attributes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
