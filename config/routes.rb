Rails.application.routes.draw do
  namespace :v1 do
    root to: '/api#v1'
    resource :person, path: 'about', only: :show
    resources :posts, only: [:index, :show]
  end

  post :authenticate, to: 'authentication#authenticate'

  root to: 'api#root'
end
