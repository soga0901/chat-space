Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users do
    collection do
      get 'search'
    end
 end
  resources 'groups', only: [:new, :create, :edit, :update, :index] do
    resources 'messages', only: [:index, :create]
  end
end
