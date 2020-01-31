Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
  
  
  namespace :admin do
    resources :stats, only: [:index]
  end
  
  # It is either use the one above or this one, but the aboce one is better
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  root 'posts#index'
end