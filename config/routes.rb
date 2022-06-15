Rails.application.routes.draw do
# devise を使用する際に URL として users を含むことを示す
  devise_for :users
# homesコントローラのルーティング
  get 'homes/top'
  get 'homes/about', as: 'about'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
