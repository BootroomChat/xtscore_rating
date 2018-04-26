class FormationLocation < ApplicationRecord
  belongs_to :player
  belongs_to :formation
  belongs_to :match
  belongs_to :team
end
