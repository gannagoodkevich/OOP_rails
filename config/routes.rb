Rails.application.routes.draw do
  resources :users do
    collection do
      resource :registrations, only: %i[show create]
      resource :sessions, only: %i[show create destroy]
      resource :confirmations, only: [:show]
    end
  end
  root 'users#root'
end
