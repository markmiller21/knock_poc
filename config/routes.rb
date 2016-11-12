Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  #TODO will be removed since it's just a form for inserting fake data
  match 'home/upload_essay_form', via: [:get, :post]

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index, :update] do
    get 'damn_form', on: :collection
  end
  resources :meetings, except: [:destroy] do
    collection do
      post 'disconnect_call_back'
      get 'accept_call'
      get 'reject_call'
      get 'alternative_time_confirm'
      match 'alternative_time', via: [:get, :post]
      match 'reject_reason', via: [:get, :post]
    end
  end

end
