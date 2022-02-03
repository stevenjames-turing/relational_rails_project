Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/golf_courses', to: 'golf_courses#index'
  get '/golf_courses/:id', to: 'golf_courses#show'
  get '/holes', to: 'holes#index'
  get '/holes/:id', to: 'holes#show'
  get 'hockey_bags', to: 'hockey_bags#index'
  get 'hockey_bags/:id', to: 'hockey_bags#show'
  get 'teams', to: 'teams#index'
  get 'teams/:id', to: 'teams#show'
end
