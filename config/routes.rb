Rails.application.routes.draw do
  devise_for :users
  
  resources :monsters
  resources :quetes
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
  get 'payObjetById'            => 'avatars#payObjetById'
  get 'restorHpWithObject'      => 'avatars#restorHpWithObject'
  get 'town'                    => 'index#town'
  get 'rest'                    => 'avatars#rest'
  get 'changeStatus'            => 'quetes#changeStatus'
  get 'finishQuest'             => 'quetes#finishQuest'
  get 'finishDonjon'            => 'avatars#finishDonjon'

  patch 'addGoldInRoom/:id/'    => 'rooms#addGoldInRoom'
  #post 'donjons/addObject'

  #get 'donjons/addObject/:avatar_id/:avatar_id' => 'donjons#addObject/avatar_id/objet_id'
end
