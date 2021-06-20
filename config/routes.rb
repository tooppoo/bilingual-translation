Rails.application.routes.draw do
  namespace :api do
    post '/translation', to: 'translation#translate'
  end
  get '/', to: 'index#index'
end
