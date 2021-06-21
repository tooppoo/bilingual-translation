Rails.application.routes.draw do
  namespace :api, format: 'json' do
    post '/translation', to: 'translation#translate'
  end
end
