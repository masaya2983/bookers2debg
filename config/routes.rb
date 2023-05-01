Rails.application.routes.draw do

 resources :book_comments,only: [:create,:destroy]
  resources :favorites,only: [:create,:destroy]

  root to:'homes#top'
 get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  get 'home/about' => 'layouts#about'

end


