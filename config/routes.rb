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
  resources :rooms
  resources :donjons do
  	resources :rooms 
  end
  get 'addObjetById'            => 'avatars#addObjetById'
  get 'removeObjetById'         => 'avatars#removeObjetById'
  get 'equipeObjet'             => 'avatars#equipeObjet'
  get 'majAvatar'               => 'avatars#majAvatar'
  get 'addGold'                 => 'avatars#addGold'
  get 'addObjetByIdToRoom'      => 'rooms#addObjetByIdToRoom'
  get 'addMonsterByIdToRoom'    => 'rooms#addMonsterByIdToRoom'
  get 'addObjetByIdToMonster'   => 'monsters#addObjetById'
  get 'craftEpeeFer'            => 'objets#craftEpeeFer'
  get 'gameover'                => 'index#gameover'
  get 'payObjetById'            => 'avatar#payObjetById'
  patch 'addGoldInRoom/:id/'    => 'rooms#addGoldInRoom'
  #post 'donjons/addObject'

  #get 'donjons/addObject/:avatar_id/:avatar_id' => 'donjons#addObject/avatar_id/objet_id'
end
