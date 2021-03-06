require 'api_version_constraint'

Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # usando subdominios !!

  # namespace :api, defaults: { format: :json}, constraints: { subdomain: 'api'}, path: '/' do
  #   namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1, default: true) do
  #     resources :users, only: [:show]
  #     #resources :produtos
  #   end

    namespace :api, defaults: { format: :json} do
      namespace :v1 do
        resources :users, only: [:show, :create, :update, :destroy]
        resources :sessions, only: [:create]
        #resources :produtos
      end

    #namespace :v2, path: "/", constraints: ApiVersionConstraint.new(version: 2) do
    #  resources :produtos
    #end
    
  end
end
