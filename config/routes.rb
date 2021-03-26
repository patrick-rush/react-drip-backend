Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  resources :notes
  get '/care_events/today' => 'care_events#today'

  resources :care_events
  resources :plants do
    resources :notes, only: [:index]
    resources :care_events, only: [:index]
  end
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
