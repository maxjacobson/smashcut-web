Rails.application.routes.draw do
  resources :screenplays, except: [:new] do
    get :download_pdf, on: :member
  end

  root :to => 'screenplays#new', as: 'new_screenplay'
end
