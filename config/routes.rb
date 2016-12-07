Rails.application.routes.draw do
  mount ActionCable.server => '/chat'
  root to: 'home#index'
  get 'home/index'

  #to redirect devise signin to home, since we don't need devise sign in form anymore.
  get '/users/sign_in', to: redirect('home/index')

  #TODO will be removed since it's just a form for inserting fake data
  match 'home/upload_essay_form', via: [:get, :post]

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index, :edit, :update]
  resources :tags do
    collection do
      post "search"
    end
  end

  resources :meetings, except: [:destroy] do
    resources :messages
    collection do
      post 'disconnect_call_back'
      get 'accept_call'
      get 'reject_call'
      get 'alternative_time_confirm'
      match 'alternative_time', via: [:get, :post]
      match 'reject_reason', via: [:get, :post]
    end
  end

  get 'carts/index' => "carts#index"
  get 'carts/checkout' => "carts#checkout"
  get 'carts/add_to_cart' => "carts#add_to_cart"
  get 'carts/clear_cart' => "carts#clear_cart"
  match 'carts/pay' => "carts#pay", via: [:get, :post]
  get 'carts/payment_confirmation' => "carts#payment_confirmation"
  post 'carts/config_cc' => "carts#config_cc"

end
