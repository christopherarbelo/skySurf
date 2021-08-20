Rails.application.routes.draw do
  root 'flights#home'
  get 'flights', to: 'flights#flights' 
end
