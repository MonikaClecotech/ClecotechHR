Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users, :controllers => { registrations: 'registrations' , omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :accounts
  resources :attendences do
     collection do
       post :sign_out
     end 
  end
  resources :organizations do 
    resources :salary_transactions
    resources :company_transactions
  end

  resources :salary_transactions do 
    collection do
      get :generate
    end
    resources :employee_salaries 
  end

  root to: 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
