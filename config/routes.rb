Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
  
  namespace :admin do
    resources :stats, only: [:index]
  end

  # get '/admin/stats', to: 'stats#index'
  #above turns into bottom

  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end
  # above turns into namespace one. we nare telling SCOPE that we want to use /admin as our URL prefix  and 
  #and we're also letting Rails know that all of the included routes will be handled by controllers in the admin module.
  
  root 'posts#index'
end
