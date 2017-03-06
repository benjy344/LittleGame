class Monster < ApplicationRecord
	has_many :bag_monsters
	has_many :objets, through: :bag_monsters
end
