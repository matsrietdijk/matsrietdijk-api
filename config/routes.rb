Rails.application.routes.draw do
  namespace :v1 do
    root to: '/api#v1'
  end

  root to: 'api#root'
end
