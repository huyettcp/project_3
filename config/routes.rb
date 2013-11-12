Project3::Application.routes.draw do
  root :to => 'teams#index'
  get '/teams', to: 'teams#index'
  
  get '/players', to: 'players#index'
  get '/cost_performance_data', to: 'players#cost_performance_data'
  get '/salary_data', to: 'players#salary_data'
  get '/player_data', to: 'players#individual_player_data'
end
