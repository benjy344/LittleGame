Rails.application.routes.draw do
  devise_for :users
  
  resources :monsters
  resources :avatars do
  		resources :objets
  	end
  root 'index#index'
  resources :jobs
  resources :objets
  resources :bags
  resources :donjons do
  	resources :avatars do
  		resources :objets
  	end
  end
  get 'addObjetById'=> 'avatars#addObjetById'
  get 'addObjetByIdToMonster'=> 'monsters#addObjetById'
  get 'craftEpeeFer'=> 'objets#craftEpeeFer'
  #post 'donjons/addObject'

  #get 'donjons/addObject/:avatar_id/:avatar_id' => 'donjons#addObject/avatar_id/objet_id'
end
