Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users'
      resources :users, only: [:index, :show] do
        resources :columns do
          resources :cards do
            resources :comments
          end
        end
      end
    end
  end
end
