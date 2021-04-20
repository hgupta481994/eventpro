Rails.application.routes.draw do
  resources :user_profiles, only: [:new, :create, :update, :edit, :show ]
  devise_for :users
  resources :events
  root 'events#index'
  post '/attend/event/:id' => 'events#attend_event', 		as: :attend_event
  post 'unattend/event/:id' => 'events#unattend_event', as: :unattend_event
end
