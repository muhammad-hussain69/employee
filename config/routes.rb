Rails.application.routes.draw do
  get 'attendances/index'

  devise_for :emps do
    get 'logout' => 'sessions#destroy', :as => :destroy_emp_session
  end

  root 'emps#index'

  resources :emps

  get 'emps/about',  to: 'emps#about', as: 'about'

  resources :attendances, only: [:index, :new, :create]

end
