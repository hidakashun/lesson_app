Rails.application.routes.draw do
  root 'homes#top'
  resources :lists, only: [:new, :index, :show, :edit]
end
