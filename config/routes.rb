Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'links#index'
  resources :links, only: [:index, :create] # , :destroy]
  resources :tags, only: :index
  get 'tags/:tag', to: 'tags#index', as: 'tag'
end
