Rails.application.routes.draw do
  
  resources :employees


  resources :emptests do 
  	collection { post :import }
  end

  devise_for :logins, :controllers=>{ :registrations => "registrations"}

 
  resources :testemps do
    collection { post :upload }
  end

  #root 'testemps#index'
  #root 'emptests#index'

  root 'welcomes#index'
  get 'dateselect', to: 'attendances#dateselect'


  #root 'attendances#index'

  #get '/login' => redirect('/logins/sign_in')

  #get 'emptests', to: 'emptests#index'

    #root "admins#index"
  

  #resources :admins do
   # collection { post :import }
  #end

 resources :attendances do
    collection { post :upload }
    collection { post :dateselect }
  end
  

  
  
end
