Rails.application.routes.draw do
  # root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :companies, only: [:index, :show, :create, :update]
  end
end
