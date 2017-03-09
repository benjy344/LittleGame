class Objet < ApplicationRecord
	has_many :bags
  	has_many :avatars, through: :bags
  	has_many :oirs
  	has_many :romms, through: :oirs
end
