Rails.application.routes.draw do
  devise_for :users
  root 'groups#new'
  resources 'groups' do
    resources 'messages'
  end
end
