Rails.application.routes.draw do
  # devise を使用する際に URL として users を含むことを示す
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy]
# booksコントローラのルーティング
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]
# homesコントローラのルーティング
  get 'homes/top'
  get 'home/about' => 'homes#about',as: 'about'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
