Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users, :controllers => { registrations: 'registrations' , omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :accounts
  resources :time_logs do
    collection do
      post :sign_out
      post :sign_in
    end 
  end
  resources :organizations do 
    resources :salary_transactions
    resources :company_transactions
  end

  resources :salary_transactions do 
    member do
      get :generate
    end
     resources :employee_salaries
  end

  resources :employee_salaries do
    collection do
      get :generate
    end
  end

  root to: 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end