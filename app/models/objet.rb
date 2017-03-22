class Objet < ApplicationRecord
	has_many :bags
  	has_many :avatars, through: :bags
  	has_many :oirs
  	has_many :rooms, through: :oirs
  	belongs_to :quetes
end
