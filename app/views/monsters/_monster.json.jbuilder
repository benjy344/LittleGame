json.extract! monster, :id, :name, :hp, :force, :agility, :exp, :element, :created_at, :updated_at
json.url monster_url(monster, format: :json)