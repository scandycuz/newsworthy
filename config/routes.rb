Rails.application.routes.draw do
  root 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :companies, only: [:index, :show, :create, :update] do
      resources :articles, only: [:index, :show, :create]
    end
    resources :articles, only: [:index, :show, :create]
    resources :datapoints, only: [:index, :show, :create, :destroy]
  end
end
