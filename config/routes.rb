Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'golf_courses/new', to: 'golf_courses#new'
  get 'golf_courses/:id/edit', to: 'golf_courses#edit'
  get 'golf_courses', to: 'golf_courses#index'
  get 'golf_courses/:id', to: 'golf_courses#show'
  get 'holes', to: 'holes#index'
  get 'holes/:id', to: 'holes#show'
  get 'holes/:id/edit', to: 'holes#edit'
  get 'golf_courses/:id/holes', to: 'golf_course_holes#index'
  get 'golf_courses/:id/holes/new', to: 'golf_course_holes#new'

  get 'teams/new', to: 'teams#new'
  get 'teams/:id/edit', to: 'teams#edit'
  get 'teams', to: 'teams#index'
  get 'teams/:id', to: 'teams#show'
  get 'players/:id', to: 'players#show'
  get 'players', to: 'players#index'
  get 'players/:id/edit', to: 'players#edit'
  get 'teams/:id/players', to: 'team_players#index'
  get 'teams/:id/players/new', to: 'team_players#new'

  post 'golf_courses', to: 'golf_courses#create'
  post 'teams', to: 'teams#create'
  post 'golf_courses/:id/holes', to: 'golf_course_holes#create'
  post 'teams/:id/players', to: 'team_players#create'

  patch 'golf_courses/:id', to: 'golf_courses#update'
  patch 'holes/:id', to: 'holes#update'
  patch 'teams/:id', to: 'teams#update'
  patch 'players/:id', to: 'players#update'

end
