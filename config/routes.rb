Rails.application.routes.draw do
  devise_for :users
  get 'images/new'
  get 'images/index'
  get 'images/show'
  get 'images/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
