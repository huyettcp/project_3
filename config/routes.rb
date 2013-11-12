Project3::Application.routes.draw do
  root :to => 'teams#index'
  get '/teams', to: 'teams#index'
  get '/players', to: 'players#index'
  get '/simple', to: 'teams#dead_simple'
end
