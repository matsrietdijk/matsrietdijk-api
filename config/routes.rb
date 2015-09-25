Rails.application.routes.draw do
  namespace :v1 do
    root to: '/api#v1'
    resources :posts, only: :index
  end

  root to: 'api#root'
end
