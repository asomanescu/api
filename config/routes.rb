Rails.application.routes.draw do
  namespace :api do
    resources :series, only: [:index]
  end
end
