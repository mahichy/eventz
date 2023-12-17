Rails.application.routes.draw do
  get 'eventz' => 'eventz#index'
  get 'eventz/:id' => 'eventz#show'
end
