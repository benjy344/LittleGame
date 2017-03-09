class Room < ApplicationRecord
	has_many :mirs
	has_many :monsters, through: :mirs
	has_many :rids
	has_many :donjons, through: :rids
	has_many :oirs
	has_many :objets, through: :oirs
end
