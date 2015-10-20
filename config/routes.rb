Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :orders do
      member do
        get :versions
      end
    end
  end

end
