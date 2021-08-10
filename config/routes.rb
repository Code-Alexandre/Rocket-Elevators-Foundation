Rails.application.routes.draw do
  resources :interventions do
    get :buildings_for_customer, on: :collection
    get :batteries_for_building, on: :collection
    get :columns_for_battery, on: :collection
    get :elevators_for_column, on: :collection
  end
  resources :leads
  devise_for :users
  resources :quotes
  get 'website/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'website#index'
  
  get '/index', to: 'website#index'
  
  get '/residential', to: 'website#residential'

  get '/commercial', to: 'website#commercial'

  get '/quote', to: 'website#quote'

  get '/machineLearning', to: 'website#machineLearning'

  post '/watson/greetings', to: 'watson#greetings'



end

