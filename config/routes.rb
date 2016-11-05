Rails.application.routes.draw do
  get 'home/index'

  #TODO will be removed since it's just a form for inserting fake data
  match 'home/upload_essay_form', via: [:get, :post]

  devise_for :users


end
