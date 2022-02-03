Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/golf_courses', to: 'golf_courses#index'
  get '/golf_courses/:id', to: 'golf_courses#show'
end
