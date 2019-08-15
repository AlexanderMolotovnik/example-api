Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :auth, controller: :auth, only: [] do
        collection do
          post :sign_in
          post :sign_up
        end
      end

      resources :users, only: [:index, :update]
    end
  end
end
