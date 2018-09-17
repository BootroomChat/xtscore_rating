class Match < ApplicationRecord
  belongs_to :home, class_name: 'Team'
  belongs_to :away, class_name: 'Team'
  belongs_to :venue
  belongs_to :league
  has_many :match_stats, dependent: :destroy
  has_many :formations, dependent: :destroy

  def teams
    [home, away]
  end
end
