Rails.application.routes.draw do
  namespace :v1 do
  end

  root to: 'api#root'
end
