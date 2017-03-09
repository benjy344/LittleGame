class Avatar < ApplicationRecord
	belongs_to :job, optional: true
	belongs_to :user
	has_many :bags
	has_many :objets, through: :bags
end
