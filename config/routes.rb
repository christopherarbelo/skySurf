Rails.application.routes.draw do
  root 'flights#home'
  get 'flights', to: 'flights#flights'
  resources :bookings, only: [:show, :new, :create]
end
