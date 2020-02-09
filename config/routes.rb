Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # scope '/admin', module: 'admin' do 
  # There is one important difference between scope '/admin', module: 'admin' and 
  # namespace :admin, and it's in the URL helpers. Remember above that using scope 
  # gave us a stats_path helper. But now that we are using namespace, run rake routes again. 
  # You'll see that the helper is now prefixed with admin_, so stats_path 
  # becomes admin_stats_path. If you switch from scope to namespace, take care to update 
  # any URL helpers you have in use!
  namespace :admin do 
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
