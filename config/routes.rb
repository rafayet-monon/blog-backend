Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      devise_for :users,
                 path_names: {
                   sign_in: 'login',
                   sign_out: 'logout',
                   registration: 'signup'
                 },
                 controllers: {
                   sessions: 'api/v1/sessions',
                   registrations: 'api/v1/registrations'
                 }
      resource :user, only: [:show, :update]
      resources :home, only: [:index]
    end
  end
end
