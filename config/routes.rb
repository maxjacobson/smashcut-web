Rails.application.routes.draw do
  resources :screenplays, except: [:new]
  root :to => 'screenplays#new', as: 'new_screenplay'
end
