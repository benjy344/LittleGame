class Quete < ApplicationRecord
	has_many :qtum
	has_many :avatars, through: :qtum
end
