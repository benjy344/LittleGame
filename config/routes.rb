Rails.application.routes.draw do
  resources :avatars do
  		resources :objets
  	end
  root 'avatars#index'
  resources :jobs
  resources :objets
  resources :bags
  resources :donjons do
  	resources :avatars do
  		resources :objets
  	end
  end
  get 'addObjetById'=> 'avatars#addObjetById'
  get 'craftEpeeFer'=> 'objets#craftEpeeFer'
  #post 'donjons/addObject'

  #get 'donjons/addObject/:avatar_id/:avatar_id' => 'donjons#addObject/avatar_id/objet_id'
end
