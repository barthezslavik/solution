Solution::Application.routes.draw do
  devise_for :users

  resources :categories

  resources :samples do
    get :custom, :on => :collection
    get :draft, :on => :collection
    resources :comments
  end

  root :to => 'samples#index'
end
