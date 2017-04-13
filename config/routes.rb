Rails.application.routes.draw do
  devise_for :users
  root 'groups#new'
  resources 'groups', only: [:new, :create, :edit, :update] do
    resources 'messages', only: [:index, :create]
  end
end
