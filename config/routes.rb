Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :orders do
      member do
        get :versions
        get :payment_versions
        get :shipment_versions
        get :return_authorization_versions
      end
    end
  end

end
