Rails.application.routes.draw do
  root 'homes#top'
  resources :lists, only: [:new, :create, :index, :show, :edit, :update]
end
