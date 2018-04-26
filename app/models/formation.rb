class Formation < ApplicationRecord
  belongs_to :match
  belongs_to :team
  has_many :formation_locations
end
