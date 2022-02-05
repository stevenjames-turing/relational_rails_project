Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'golf_courses/new', to: 'golf_courses#new'
  get 'teams/new', to: 'teams#new'
  get 'golf_courses', to: 'golf_courses#index'
  get 'golf_courses/:id', to: 'golf_courses#show'
  get 'holes', to: 'holes#index'
  get 'holes/:id', to: 'holes#show'
  get 'teams', to: 'teams#index'
  get 'teams/:id', to: 'teams#show'
  get 'players', to: 'players#index'
  get 'players/:id', to: 'players#show'
  get 'golf_courses/:id/holes', to: 'golf_course_holes#index'
  get 'teams/:id/players', to: 'team_players#index'

  post 'golf_courses', to: 'golf_courses#create'
  post 'teams', to: 'teams#create'

end
