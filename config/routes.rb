StripeApp::Application.routes.draw do
  resources :plans
  resources :subscriptions
  root :to => 'plans#index'
end
