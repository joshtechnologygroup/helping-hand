Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: %i[create update]
  resource :user, only: %i[create update show] do
    patch 'change_password', on: :member
  end
end
