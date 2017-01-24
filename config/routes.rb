Rails.application.routes.draw do
  root to: 'layouts#application'

  namespace :api, defaults: {format: :json} do
    resources :companies, only: [:index, :show, :create, :update]
    resources :articles, only: [:index, :show, :create]
    resources :datapoints, only: [:index, :show, :create, :destroy]
  end
end
