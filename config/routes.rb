Rails.application.routes.draw do
  get '/' => 'home#index', as: :home
  resources :requests
  get '/requests/:id/change' => 'requests#change'

  get '/search' => 'requests#search'
end
