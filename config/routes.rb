Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :accounts
  resources :organizations do 
    resources :salary_transactions
  end

  resources :salary_transactions do 
    collection do
      get :month
      get :view
    end
    member do
      get :download
    end
    resources :employee_salaries 
  end

  root to: 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
