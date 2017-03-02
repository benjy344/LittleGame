class Avatar < ApplicationRecord
	belongs_to :job, optional: true
	has_many :bags
	has_many :objets, through: :bags
end
