Rails.application.routes.draw do
  match 'user/login', to: 'user#login', via: [:options, :get, :post]
  match 'user/register', to: 'user#create', via: [:options, :post]
  match 'user/test', to: 'user#test', via: [:options, :get, :post]
end
