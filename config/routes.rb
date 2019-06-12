Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :activities, only: [:index]
  resources :skills, only: [:index]
  resources :users, only: [:show]
  resources :user_activities, only: [:new, :create] do
    member do
      patch :accomplish
    end
  end
  resources :user_skills, only: [:index] do
    collection do
      patch :update_multiple
    end
  end
end
