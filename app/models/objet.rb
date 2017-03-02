class Objet < ApplicationRecord
	has_many :bags
  	has_many :avatars, through: :bags
end
