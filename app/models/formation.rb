class Formation < ApplicationRecord
  belongs_to :match
  belongs_to :team
  belongs_to :captain, class_name: Player, foreign_key: :captain_id
  has_many :formation_locations

  def as_json(options = {})
    {name: name, start_min: start_min, end_min: end_min,
     captain: {player_name: captain.name, shirt_no: captain.shirt_no},
     locations: formation_locations.map {|location| {x: location.x, y: location.y,
                                                     player_name: location.player.name,
                                                     shirt_no: location.player.shirt_no}}}
  end
end
