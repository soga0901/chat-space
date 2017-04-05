Rails.application.routes.draw do
  devise_for :users
  resources 'messages', only: [:show]
end
