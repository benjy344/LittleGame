class Donjon < ApplicationRecord
	has_many :rids
	has_many :rooms, through: :rids
end
