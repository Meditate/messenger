Rails.application.routes.draw do

  devise_for :users

  root "static_pages#index"

  resources :users

  match '/send_mail', to: 'users#send_mail', via: 'post'

end
