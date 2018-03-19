Rails.application.routes.draw do
	root 'users#home'
	post 'users/login',to:'users#login'
  get 'users/signin',to:'users#signin'
  get 'users/logout',to:'users#logout'
  get 'users/about' ,to:'users#about'
  get 'users/admin',to:'users#admin'
  get 'users/admin/signin',to:'users#admin_signin'
  post 'users/admin/login',to:'users#admin_login'
  get 'votes/winner',to:'votes#winner'
  get 'votes/participants',to:'votes#participants'
  post 'votes/vcreate',to:'votes#vcreate'
  resources :users
  resources :competitions do
  	resources :uploads
    resources :videos
  end
  resources :votes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
