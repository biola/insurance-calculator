Rails.application.routes.draw do
  get 'calculator' => 'calculator#index'
  post 'calculator' => 'calculator#index'

  namespace :admin do
    resources :coverages
    resources :rates do
      collection do
        get :multiple_edit
        post :multiple_update
      end
    end
    resources :child_coverages

    root 'rates#index'
  end

  # this is just a convenience to create a named route to rack-cas' logout
  get '/logout' => -> env { [200, { 'Content-Type' => 'text/html' }, ['Rack::CAS should have caught this']] }, as: :logout

  root 'calculator#index'
end
